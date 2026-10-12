{ ... }:
{
  flake.modules.nixos."features-packages-nixos" =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        brave
        ghostty
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
