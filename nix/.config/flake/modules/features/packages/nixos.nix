{ ... }:
{
  flake.nixosModules."features-packages-nixos" =
    { pkgs, ... }:
    {
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
