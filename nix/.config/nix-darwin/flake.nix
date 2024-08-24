{
  description = "Ido's system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixcasks = {
      url = "github:jacekszymanski/nixcasks";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, nixcasks }:
    let
      system = "aarch64-darwin";
      mac = "Idos-MacBook-Pro";
      nixcasks = (inputs.nixcasks.output {
         osVersion = "sonoma";
      }).packages.${system};
      pkgs = import nixpkgs {
        inherit system;
        config.packageOverrides = _: {
          inherit nixcasks;
        };
      };
    in {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#Idos-MacBook-Pro
    darwinConfigurations.${mac} = nix-darwin.lib.darwinSystem {
      modules = [ ./darwin/configuration.nix ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations.${mac}.pkgs;

    # Build home-manager flake using:
    # $ home-manager build --flake .
    homeConfigurations = {
      "idoslonimsky" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home-manager/home.nix ];
      };
    };
  };
}
