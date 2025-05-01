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

    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, nix-homebrew }:
    let
      system = "aarch64-darwin";
      nix-homebrew-config = {
        nix-homebrew = {
          enable = true;
          autoMigrate = true;
          # Apple Silicon Only
          enableRosetta = true;
          user = "idoslonimsky";
        };
      };

      commonDarwinModules = [
        ./darwin/configuration.nix
        nix-homebrew.darwinModules.nix-homebrew
        nix-homebrew-config
      ];

      mkDarwinSystem = modules: nix-darwin.lib.darwinSystem {
          inherit system;
          modules = modules;
      };

    in {
      legacyPackages = nixpkgs.legacyPackages.${system};

      # Build darwin flake using:
      # $ darwin-rebuild build --flake .
      darwinConfigurations = {
        "Idos-MacBook-Pro" = mkDarwinSystem commonDarwinModules;
        "Idos-MacBook-Air" = mkDarwinSystem commonDarwinModules;
      };

      # Build home-manager flake using:
      # $ home-manager build --flake .
      homeConfigurations = {
         "idoslonimsky" = home-manager.lib.homeManagerConfiguration {
            modules = [ ./home-manager/home.nix ];
          };
      };
    };
}
