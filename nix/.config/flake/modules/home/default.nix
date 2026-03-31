{ self, inputs, ... }:
let
  selectHomeProfile = system:
    if builtins.match ".*-darwin" system != null then
      self.homeModules."home-profile-darwin"
    else if builtins.match ".*-linux" system != null then
      self.homeModules."home-profile-linux"
    else
      throw "Unsupported system for Home Manager profile selection: ${system}";

  mkHomeConfiguration = system:
    inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = inputs.nixpkgs.legacyPackages.${system};
      modules = [ (selectHomeProfile system) ];
    };

  currentSystem = if builtins ? currentSystem then builtins.currentSystem else "aarch64-darwin";

  mkHomePackage = system:
    let
      activationPackage = (mkHomeConfiguration system).activationPackage;
    in
    activationPackage // {
      inherit activationPackage;
    };
in
{
  flake.homeConfigurations.idoslonimsky = mkHomeConfiguration currentSystem;

  perSystem = { system, ... }: {
    packages.homeConfigurations =
      let
        homePackage = mkHomePackage system;
      in
      homePackage // {
        idoslonimsky = homePackage;
      };
  };
}
