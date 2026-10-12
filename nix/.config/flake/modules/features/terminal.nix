{ inputs, self, ... }:
{
  flake.modules.generic.terminal =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        atuin
        fzf
        starship
        tmux
        inputs.workmux.packages.${pkgs.stdenv.hostPlatform.system}.default
      ];
    };

  flake.modules.nixos.terminal =
    { pkgs, ... }:
    {
      imports = [ self.modules.generic.terminal ];
      environment.systemPackages = [ pkgs.ghostty ];
    };

  flake.modules.darwin.terminal =
    { pkgs, ... }:
    {
      imports = [ self.modules.generic.terminal ];
      environment.systemPackages = [ pkgs.ghostty-bin ];
    };
}
