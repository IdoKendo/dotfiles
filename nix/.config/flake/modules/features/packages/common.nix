{ ... }:
let
  commonPackagesModule =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        bat
        cmatrix
        coreutils
        curl
        execline
        eza
        fastfetch
        fd
        ffmpeg
        ghostscript
        gnupg
        gnused
        gnutls
        gtypist
        gum
        jq
        less
        obsidian
        pastel
        presenterm
        pwgen
        ripgrep
        stow
        telegram-desktop
        unixtools.watch
        unzip
        (if stdenv.hostPlatform.isDarwin then vlc-bin else vlc)
        wget
        xdg-ninja
      ];
    };
in
{
  flake.modules.nixos."features-packages-common" = commonPackagesModule;
  flake.modules.darwin."features-packages-common" = commonPackagesModule;
}
