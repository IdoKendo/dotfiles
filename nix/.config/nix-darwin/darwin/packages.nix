{ pkgs, lib, config, ... }: {
  options = {
    darwinpackages.enable =
      lib.mkEnableOption "includes darwin packages";
  };

  config = lib.mkIf config.darwinpackages.enable {
    environment.systemPackages = with pkgs; [
      mkalias
    ];
  };
}
