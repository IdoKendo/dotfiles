{ ... }:
{
  flake.modules.nixos."features-packages-nixos" =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        brave
        ghostty
        gnomeExtensions.space-bar
        gnomeExtensions.switcher
        gnomeExtensions.tactile
        gnomeExtensions.just-perfection
        xclip
      ];
      programs.nix-ld = {
        enable = true;
        libraries = with pkgs; [
          stdenv.cc.cc.lib
          zlib
          openssl
        ];
      };
    };
}
