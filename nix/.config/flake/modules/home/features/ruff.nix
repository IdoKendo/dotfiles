{ ... }:
{
  flake.homeModules."features-home-ruff" = {
    programs.ruff = {
      enable = true;
      settings = {
        line-length = 88;
        indent-width = 4;
        target-version = "py311";
        exclude = [
          ".bzr"
          ".direnv"
          ".eggs"
          ".git"
          ".git-rewrite"
          ".hg"
          ".ipynb_checkpoints"
          ".mypy_cache"
          ".nox"
          ".pants.d"
          ".pyenv"
          ".pytest_cache"
          ".pytype"
          ".ruff_cache"
          ".svn"
          ".tox"
          ".venv"
          ".vscode"
          "__pypackages__"
          "_build"
          "buck-out"
          "build"
          "dist"
          "node_modules"
          "site-packages"
          "venv"
        ];
        lint = {
          select = [
            "A"
            "ARG"
            "ASYNC"
            "B"
            "C4"
            "E"
            "F"
            "I"
            "N"
            "PT"
            "RUF"
            "SIM"
            "TID"
            "UP"
            "W"
          ];
          ignore = [ ];
          fixable = [ "ALL" ];
          unfixable = [ ];
          dummy-variable-rgx = "^(_+|(_+[a-zA-Z0-9_]*[a-zA-Z0-9]+?))$";
          isort.force-single-line = true;
          flake8-bugbear.extend-immutable-calls = [
            "fastapi.Depends"
            "fastapi.params.Depends"
            "fastapi.Query"
            "fastapi.params.Query"
          ];
        };
        format = {
          quote-style = "double";
          indent-style = "space";
          skip-magic-trailing-comma = true;
          line-ending = "auto";
          docstring-code-format = false;
          docstring-code-line-length = "dynamic";
        };
      };
    };
  };
}
