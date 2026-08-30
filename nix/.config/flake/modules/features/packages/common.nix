{ inputs, ... }:
let
  commonPackagesModule =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        atuin
        bash-language-server
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
        fzf
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
        pastel
        presenterm
        pwgen
        ripgrep
        silicon
        sqlite
        starship
        stow
        telegram-desktop
        tmux
        unixtools.watch
        unzip
        wget
        (inputs.workmux.packages.${pkgs.stdenv.hostPlatform.system}.default)
        xdg-ninja
      ];
    };
in
{
  flake.nixosModules."features-packages-common" = commonPackagesModule;
  flake.darwinModules."features-packages-common" = commonPackagesModule;
}
