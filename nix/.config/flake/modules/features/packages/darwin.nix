{ ... }:
let
  darwinPackagesModule =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        aerospace
        ghostty-bin
        mkalias
      ];
    };
in
{
  flake.darwinModules."features-packages-darwin" = darwinPackagesModule;
}
