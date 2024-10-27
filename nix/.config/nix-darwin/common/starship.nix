{ ... }:
let
  format    = "[░▒▓](#a3aed2)[  ](bg:#a3aed2 fg:#090c0c)[](bg:#526fa8 fg:#a3aed2)$directory[](fg:#526fa8 bg:#394260)$git_branch$git_status[](fg:#394260 bg:#212736)$nodejs$lua$rust$golang$python[](fg:#212736 bg:#1d2230)$time[ ](fg:#1d2230)\n$character";
  transient = "[░▒▓](#a3aed2)[  ](bg:#a3aed2 fg:#090c0c)[](bg:#526fa8 fg:#a3aed2)[](fg:#526fa8 bg:#394260)[](fg:#394260 bg:#212736)[](fg:#212736 bg:#1d2230)$time[](fg:#1d2230)\n$character";
in
{
  programs.starship = {
    enable = true;
    settings = {
      format = format;
      command_timeout = 3000;

      profiles = {
        transient = transient;
      };

      character = {
        success_symbol = "[➜](bold blue) ";
        error_symbol = "[✗](bold red) ";
        vimcmd_symbol = "[V](bold blue) ";
      };

      directory = {
        style = "fg:#e3e5e5 bg:#526fa8";
        format = "[ $path ]($style)";
        truncation_length = 3;
        truncation_symbol = "…/";

        substitutions = {
          "Documents" = "󰈙 ";
          "Downloads" = " ";
          "Music" = " ";
          "Pictures" = " ";
        };
      };

      git_branch = {
        symbol = "";
        style = "bg:#394260";
        format = "[[ $symbol $branch ](fg:#526fa8 bg:#394260)]($style)";
      };

      git_status = {
        style = "bg:#394260";
        format = "[[($all_status$ahead_behind )](fg:#526fa8 bg:#394260)]($style)";
      };

      nodejs = {
        symbol = "";
        style = "bg:#212736";
        format = "[[ $symbol ($version) ](fg:#526fa8 bg:#212736)]($style)";
      };

      lua = {
        symbol = "";
        style = "bg:#212736";
        format = "[[ $symbol ($version) ](fg:#526fa8 bg:#212736)]($style)";
      };

      python = {
        symbol = "";
        style = "bg:#212736";
        format = "[[ $symbol ($version) ($virtualenv)](fg:#526fa8 bg:#212736)]($style)";
      };

      rust = {
        symbol = "";
        style = "bg:#212736";
        format = "[[ $symbol ($version) ](fg:#526fa8 bg:#212736)]($style)";
      };

      golang = {
        symbol = "";
        style = "bg:#212736";
        format = "[[ $symbol ($version) ](fg:#526fa8 bg:#212736)]($style)";
      };

      time = {
        disabled = false;
        time_format = "%R";
        style = "bg:#1d2230";
        format = "[[  $time ](fg:#a0a9cb bg:#1d2230)]($style)";
      };
    };
  };
}
