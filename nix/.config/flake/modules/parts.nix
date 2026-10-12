{ config, inputs, lib, ... }:
{
  imports = [ inputs.flake-parts.flakeModules.modules ];

  options.flake.darwinConfigurations = lib.mkOption {
    type = lib.types.lazyAttrsOf lib.types.raw;
    default = { };
    description = "nix-darwin system configurations.";
  };

  options.flake.darwinModules = lib.mkOption {
    type = lib.types.lazyAttrsOf lib.types.deferredModule;
    default = { };
    description = "Reusable nix-darwin modules.";
  };

  options.flake.nixosHostModules = lib.mkOption {
    type = lib.types.lazyAttrsOf lib.types.deferredModule;
    default = { };
    description = "Reusable host-specific NixOS modules.";
  };

  config = {
    flake.nixosModules = builtins.removeAttrs config.flake.modules.nixos [ "nixos" ];
    flake.darwinModules = config.flake.modules.darwin;
    flake.nixosHostModules.nixos = config.flake.modules.nixos.nixos;

    systems = [
      "x86_64-linux"
      "x86_64-darwin"
      "aarch64-linux"
      "aarch64-darwin"
    ];
  };
}
