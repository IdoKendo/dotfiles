{ ... }:
let
  commonPackagesModule =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        bat
        clang-tools
        cmake
        cmatrix
        coreutils
        ctx7
        curl
        delta
        execline
        eza
        fastfetch
        fd
        ffmpeg
        gettext
        ghostscript
        git
        gnupg
        gnused
        gnutls
        gtypist
        gum
        jq
        less
        lua51Packages.jsregexp
        lua51Packages.lua
        luarocks
        mise
        neovim
        nil
        obsidian
        pastel
        presenterm
        pwgen
        ripgrep
        silicon
        sqlite
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
