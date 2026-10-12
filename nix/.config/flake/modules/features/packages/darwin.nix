{ ... }:
let
  darwinPackagesModule =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        aerospace
      ];
    };
in
{
  flake.modules.darwin."features-packages-darwin" = darwinPackagesModule;
}
