{ self, ... }:
let
  userName = "idoslonimsky";
in
{
  flake.modules.nixos.ido =
    { pkgs, ... }:
    {
      programs.zsh.enable = true;

      users.users.${userName} = {
        isNormalUser = true;
        description = "Ido Slonimsky";
        extraGroups = [
          "docker"
          "networkmanager"
          "wheel"
        ];
        shell = pkgs.zsh;
        packages = [ ];
      };
    };

  flake.modules.darwin.ido = {
    programs.zsh.enable = true;
    system.primaryUser = userName;
  };

  flake.modules.nixos."features-nixos-user" = {
    imports = [ self.modules.nixos.ido ];
  };
}
