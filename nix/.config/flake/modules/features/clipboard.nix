{ self, ... }:
{
  flake.modules.nixos.clipboard =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        xclip
      ];
    };

  flake.modules.nixos."features-packages-nixos" = {
    imports = [ self.modules.nixos.clipboard ];
  };
}
