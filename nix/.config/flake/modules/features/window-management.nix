{ self, ... }:
{
  flake.modules.darwin.window-management =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        aerospace
      ];
    };

  flake.modules.darwin."features-packages-darwin" = {
    imports = [ self.modules.darwin.window-management ];
  };
}
