{ inputs, ... }:
{
  flake.modules.darwin.homebrew =
    { config, ... }:
    {
      imports = [ inputs.nix-homebrew.darwinModules.nix-homebrew ];

      nix-homebrew = {
        enable = true;
        autoMigrate = true;
        enableRosetta = true;
        user = config.system.primaryUser;
      };

      homebrew = {
        enable = true;
        onActivation = {
          cleanup = "zap";
          autoUpdate = false;
          upgrade = true;
        };
        taps = [
          {
            name = "FelixKratz/formulae";
            trusted = true;
          }
          {
            name = "nikitabobko/tap";
            trusted = true;
          }
        ];
        brews = [
          "postgresql@16"
          "FelixKratz/formulae/sketchybar"
          "anomalyco/tap/opencode-v2"
        ];
        casks = [
          "codexbar"
          "gimp"
        ];
      };
    };
}
