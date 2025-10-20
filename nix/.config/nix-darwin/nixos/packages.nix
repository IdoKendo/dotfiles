{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    nixospackages.enable = lib.mkEnableOption "includes NixOS packages";
  };

  config = lib.mkIf config.nixospackages.enable {
    environment.systemPackages = with pkgs; [
      brave
      ghostty
      gnomeExtensions.space-bar
      gnomeExtensions.switcher
      gnomeExtensions.tactile
      gnomeExtensions.just-perfection
      slirp4netns
      xclip
    ];
  };
}
