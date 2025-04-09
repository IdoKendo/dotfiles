{ pkgs, ... }: {
  # Install custom fonts.
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
  ];
}
