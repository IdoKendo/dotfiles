#!/usr/bin/env zsh

if (( $+functions[_helm] )) && (( ! $+functions[_helm_with_values] )); then
  _helm_set_value_keys() {
    emulate -L zsh
    setopt localoptions no_aliases

    local subcommand chart token prefix values key value_file
    local dependency_name dependency_alias dependency_dir dependency_archive
    local -a before_set positional keys values_files
    subcommand=''
    chart=''

    before_set=()
    local i=1
    while (( i < CURRENT )); do
      token=${words[i]}
      if [[ $token == --set || $token == --set=* ]]; then
        break
      fi
      before_set+=("$token")
      (( i++ ))
    done

    for token in $before_set; do
      case $token in
        template|install|upgrade)
          subcommand=$token
          ;;
      esac
    done
    [[ -n $subcommand ]] || return 1

    # Collect operands before --set, skipping known option arguments.
    local skip_next=0
    local value_file_next=0
    for token in $before_set; do
      if (( skip_next )); then
        skip_next=0
        if (( value_file_next )); then
          values_files+=("$token")
          value_file_next=0
        fi
        continue
      fi

      case $token in
        -*)
          case $token in
            --values|-f)
              skip_next=1
              value_file_next=1
              ;;
            --namespace|--kube-context|--kubeconfig|--version|--repo|--username|--password|--timeout|--output-dir|--post-renderer|--description|--set-string|--set-file|--set-json)
              skip_next=1
              ;;
          esac
          ;;
        template|install|upgrade) ;;
        *)
          positional+=("$token")
          ;;
      esac
    done

    (( ${#positional} )) || return 1
    chart=${positional[-1]}

    if [[ -f "$chart/Chart.yaml" && -f "$chart/values.yaml" ]]; then
      values_files=("$chart/values.yaml" $values_files)
      keys+=(${(f)"$(<"$chart/values.yaml" _helm_yaml_to_keys '')"})

      # Dependency keys use the chart alias, falling back to its name.
      while IFS=$'\t' read -r dependency_name dependency_alias; do
        [[ -n $dependency_name && -n $dependency_alias ]] || continue
        dependency_dir=''
        if [[ -f "$chart/charts/$dependency_name/values.yaml" ]]; then
          dependency_dir="$chart/charts/$dependency_name"
        elif [[ -f "$chart/charts/$dependency_alias/values.yaml" ]]; then
          dependency_dir="$chart/charts/$dependency_alias"
        fi

        if [[ -n $dependency_dir ]]; then
          keys+=(${(f)"$(<"$dependency_dir/values.yaml" _helm_yaml_to_keys "$dependency_alias")"})
          continue
        fi

        for dependency_archive in "$chart"/charts/"$dependency_name"-*.tgz(N); do
          [[ -f $dependency_archive ]] || continue
          values=$(helm show values "$dependency_archive" 2>/dev/null) || continue
          keys+=(${(f)"$(print -r -- "$values" | _helm_yaml_to_keys "$dependency_alias")"})
          break
        done
      done < <(yq -r '.dependencies[]? | [.name, (.alias // .name)] | @tsv' "$chart/Chart.yaml" 2>/dev/null)
    else
      values=$(helm show values "$chart" 2>/dev/null) || return 1
      keys+=(${(f)"$(print -r -- "$values" | _helm_yaml_to_keys '')"})
    fi

    for value_file in $values_files; do
      [[ -r $value_file ]] || continue
      values=$(<"$value_file") || continue
      keys+=(${(f)"$(print -r -- "$values" | _helm_yaml_to_keys '')"})
    done

    typeset -U keys
    (( ${#keys} )) || return 1

    if [[ $words[CURRENT] == --set ]]; then
      prefix=''
    elif [[ $words[CURRENT] == --set=* ]]; then
      prefix=${words[CURRENT]#--set=}
      prefix=${prefix%%=*}
    elif (( CURRENT > 1 )) && [[ $words[CURRENT-1] == --set ]]; then
      prefix=${PREFIX%%=*}
    else
      return 1
    fi

    local -a matches fuzzy_matches
    for key in $keys; do
      if [[ ${key:l} == ${prefix:l}* ]]; then
        matches+=("${key}=")
      elif _helm_value_fuzzy_match "$prefix" "$key"; then
        fuzzy_matches+=("${key}=")
      fi
    done

    if (( ${#matches} )); then
      compadd -Q -S '' -M 'm:{a-zA-Z}={A-Za-z}' -- $matches
    elif (( ${#fuzzy_matches} )); then
      # Replace the abbreviation; menu completion avoids inserting a partial key.
      local saved_prefix=$PREFIX
      PREFIX=''
      if (( ${#fuzzy_matches} > 1 && $+parameters[compstate] )); then
        compstate[insert]=menu
      fi
      compadd -Q -S '' -- $fuzzy_matches
      local completion_status=$?
      PREFIX=$saved_prefix
      return $completion_status
    else
      return 1
    fi

    return 0
  }

  _helm_yaml_to_keys() {
    emulate -L zsh
    local prefix=$1
    local key_path

    while IFS= read -r key_path; do
      [[ -n $key_path ]] || continue
      if [[ -n $prefix ]]; then
        print -r -- "$prefix.$key_path"
      else
        print -r -- "$key_path"
      fi
    done < <(yq -r '.. | path | map(select(tag == "!!str")) | join(".")' 2>/dev/null)
  }

  _helm_value_fuzzy_match() {
    emulate -L zsh
    local needle=${1:l} haystack=${2:l} character

    needle=${needle//[._-]/}
    haystack=${haystack//[._-]/}
    while [[ -n $needle ]]; do
      character=${needle[1]}
      needle=${needle[2,-1]}
      [[ $haystack == *${character}* ]] || return 1
      haystack=${haystack#*${character}}
    done

    return 0
  }

  _helm_with_values() {
    if [[ ${words[CURRENT]} == --set || ${words[CURRENT]} == --set=* ]] ||
       { (( CURRENT > 1 )) && [[ ${words[CURRENT-1]} == --set ]]; }; then
      if (( ! $+commands[yq] )); then
        _message 'Helm value completion requires yq v4 (Mike Farah); install it with: brew install yq'
        return 0
      fi

      # Keep Helm's file completion out of --set, even when no keys match.
      _helm_set_value_keys
      compdef _helm_with_values helm
      return 0
    fi

    # Helm may re-register itself when autoloaded; restore the wrapper afterward.
    _helm "$@"
    local completion_status=$?
    compdef _helm_with_values helm
    return $completion_status
  }

  compdef _helm_with_values helm
fi
