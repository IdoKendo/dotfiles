{ self, ... }:
{
  flake.modules.generic.development =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        clang-tools
        cmake
        ctx7
        delta
        gettext
        git
        lua51Packages.jsregexp
        lua51Packages.lua
        luarocks
        mise
        neovim
        nil
        silicon
        sqlite
      ];
    };

  flake.modules.nixos.development =
    { pkgs, ... }:
    {
      imports = [ self.modules.generic.development ];

      programs.nix-ld = {
        enable = true;
        libraries = with pkgs; [
          stdenv.cc.cc.lib
          zlib
          openssl
        ];
      };
    };

  flake.modules.darwin.development = {
    imports = [ self.modules.generic.development ];
  };
}
