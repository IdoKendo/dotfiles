{ ... }:
let
  darwinPackagesModule =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        aerospace
        ghostty-bin
      ];
    };
in
{
  flake.modules.darwin."features-packages-darwin" = darwinPackagesModule;
}
