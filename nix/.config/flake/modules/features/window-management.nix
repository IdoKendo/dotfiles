{ ... }:
{
  flake.modules.darwin.window-management =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        aerospace
      ];
    };
}
