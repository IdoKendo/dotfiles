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
  flake.modules.darwin."features-packages-darwin" = darwinPackagesModule;
}
