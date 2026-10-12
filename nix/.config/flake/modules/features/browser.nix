{ ... }:
{
  flake.modules.nixos.browser =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.brave ];
    };
}
