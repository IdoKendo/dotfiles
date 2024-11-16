{
  description = "Ido's NixOS system configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixarr = {
      url = "github:rasmus-kirk/nixarr";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, home-manager, nix-darwin, nixarr, ... }:
    let
      system = "x86_64-linux";
      system-mac = "aarch64-darwin";
      pkgs = nixpkgs.legacyPackages.${system};
      unstable = nixpkgs-unstable.legacyPackages.${system};
      mac = "Ido-Macbook-Pro";
      nodes = [ "nixos" ];
    in {
    nixosConfigurations = builtins.listToAttrs (map (name: {
	  name = name;
	  value = nixpkgs.lib.nixosSystem {
        specialArgs = {
          meta = { hostname = name; };
        };
        inherit system;
        modules = [
          ./nixos/configuration.nix
          nixarr.nixosModules.default
        ];
      };
    }) nodes);

    darwinConfigurations.${mac} = nix-darwin.lib.darwinSystem {
      modules = [ ./darwin/configuration.nix ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations.${mac}.pkgs;

    homeConfigurations.idoslonimsky = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = {
        inherit unstable;
      };
      modules = [
        ./home-manager/home.nix
      ];
    };
  };
}
