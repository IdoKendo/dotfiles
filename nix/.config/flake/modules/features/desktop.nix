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
  flake.nixosModules."features-desktop" = desktopModule;
  flake.darwinModules."features-desktop" = desktopModule;
}
