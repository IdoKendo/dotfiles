{ ... }:
{
  programs.atuin = {
    enable = true;
    settings = {
      keymap_mode = "vim-insert";
      enter_accept = true;
      history_filter = [
         "^v \.$"
         "^which "
      ];
    };
  };
}
