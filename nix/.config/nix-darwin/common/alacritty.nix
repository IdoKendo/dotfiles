{ lib, config, ... }:
{
  options = {
    alacritty.enable =
      lib.mkEnableOption "enables alacritty";
  };

  config = lib.mkIf config.alacritty.enable {
    programs.alacritty = {
      enable = true;
      settings = {
        env = {
          "TERM" = "xterm-256color";
        };
        window = {
          decorations = "Buttonless";
          opacity = 0.8;
          option_as_alt = "Both";
          padding.x = 10;
          padding.y = 10;
        };
        keyboard = {
          bindings = [
            { key = "Right"; mods = "Alt"; chars = "\\u001BF"; }
            { key = "Left"; mods = "Alt"; chars = "\\u001BB"; }
          ];
        };
        font = {
          normal.family = "GohuFont 14 Nerd Font Mono";
          size = 20;
        };
        colors = {
          primary = {
            background = "#1a1b26";
            foreground = "#c0caf5";
          };
          cursor = {
            cursor = "#c0caf5";
            text = "#1a1b26";
          };
          normal = {
            black = "#15161e";
            red = "#f7768e";
            green = "#9ece6a";
            yellow = "#e0af68";
            blue = "#7aa2f7";
            magenta = "#bb9af7";
            cyan = "#7dcfff";
            white = "#a9b1d6";
          };
          bright = {
            black = "#414868";
            red = "#f7768e";
            green = "#9ece6a";
            yellow = "#e0af68";
            blue = "#7aa2f7";
            magenta = "#bb9af7";
            cyan = "#7dcfff";
            white = "#c0caf5";
          };
          indexed_colors = [
            { index = 16; color = "#ff9e64"; }
            { index = 17; color = "#db4b4b"; }
          ];
        };
      };
    };
  };
}
