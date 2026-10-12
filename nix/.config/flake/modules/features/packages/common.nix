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
        gnupg
        gnused
        gnutls
        gtypist
        gum
        jq
        less
        pastel
        pwgen
        ripgrep
        stow
        telegram-desktop
        unixtools.watch
        unzip
        wget
        xdg-ninja
      ];
    };
in
{
  flake.modules.nixos."features-packages-common" = commonPackagesModule;
  flake.modules.darwin."features-packages-common" = commonPackagesModule;
}
