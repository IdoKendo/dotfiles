{ self, ... }:
{
  flake.modules.generic.nix-policy = {
    nixpkgs.config.allowUnfree = true;

    nix.settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      use-xdg-base-directories = true;
    };
  };

  flake.modules.nixos.nix-policy = {
    imports = [ self.modules.generic.nix-policy ];
  };

  flake.modules.darwin.nix-policy = {
    imports = [ self.modules.generic.nix-policy ];
    nix.enable = false;
  };
}
