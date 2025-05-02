{ pkgs, lib, config, ... }: {
  options = {
    packages.enable =
      lib.mkEnableOption "includes NixOS packages";
  };

  config = lib.mkIf config.packages.enable {
    environment.systemPackages = with pkgs; [
      brave
      gnomeExtensions.space-bar
      gnomeExtensions.switcher
      gnomeExtensions.tactile
      gnomeExtensions.just-perfection
      slirp4netns
      xclip
    ];
  };
}
