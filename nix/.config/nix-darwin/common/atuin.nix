{ ... }:
{
  programs.atuin = {
    enable = true;
    settings = {
      keymap_mode = "vim-insert";
      enter_accept = true;
      style = "full";
      inline_height = 0;
      history_filter = [
         "^cat "
         "^cd "
         "^ll"
         "^v \.$"
         "^which "
         "^:q"
      ];
    };
  };
}
