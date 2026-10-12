{ self, ... }:
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

  flake.modules.nixos."features-desktop" = {
    imports = [ self.modules.nixos.fonts ];
  };
  flake.modules.darwin."features-desktop" = {
    imports = [ self.modules.darwin.fonts ];
  };
}
