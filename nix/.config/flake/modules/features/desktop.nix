{ ... }:
let
  desktopModule =
    { pkgs, ... }:
    {
      fonts.packages = with pkgs; [
        nerd-fonts.caskaydia-mono
      ];
    };
in
{
  flake.modules.nixos."features-desktop" = desktopModule;
  flake.modules.darwin."features-desktop" = desktopModule;
}
