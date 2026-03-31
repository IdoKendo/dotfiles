{ self, ... }:
{
  flake.homeModules."home-profile-common" = {
    imports = [
      self.homeModules."features-home-atuin"
      self.homeModules."features-home-ruff"
      self.homeModules."features-home-starship"
    ];

    xdg.enable = true;

    programs = {
      eza.enable = true;
      home-manager.enable = true;
    };
  };
}
