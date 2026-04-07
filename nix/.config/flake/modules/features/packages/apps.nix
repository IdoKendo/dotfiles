{ inputs, ... }:
let
  appsOverlay = final: prev:
    let
      appsPkgs = inputs.nixpkgs-apps.legacyPackages.${prev.system};
    in
    {
      neovim = appsPkgs.neovim;
      neovim-unwrapped = appsPkgs.neovim-unwrapped;
      ghostty-bin = appsPkgs.ghostty-bin;
      ghostty = appsPkgs.ghostty;
    };

  appsOverridesModule = {
    nixpkgs.overlays = [ appsOverlay ];
  };
in
{
  flake.nixosModules."features-packages-apps-overrides" = appsOverridesModule;
  flake.darwinModules."features-packages-apps-overrides" = appsOverridesModule;
}
