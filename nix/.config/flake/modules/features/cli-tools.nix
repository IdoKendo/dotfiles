{ ... }:
let
  cliToolsModule =
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
        unixtools.watch
        unzip
        wget
        xdg-ninja
      ];
    };
in
{
  flake.modules.nixos.cli-tools = cliToolsModule;
  flake.modules.darwin.cli-tools = cliToolsModule;
}
