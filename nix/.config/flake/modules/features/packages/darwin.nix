{ ... }:
let
  darwinPackagesModule =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        ghostty-bin
        mkalias
      ];
    };
in
{
  flake.darwinModules."features-packages-darwin" = darwinPackagesModule;
}
