{ ... }:
let
  fontsModule =
    { pkgs, ... }:
    {
      fonts.packages = with pkgs; [
        nerd-fonts.caskaydia-mono
      ];
    };
in
{
  flake.modules.nixos.fonts = fontsModule;
  flake.modules.darwin.fonts = fontsModule;
}
