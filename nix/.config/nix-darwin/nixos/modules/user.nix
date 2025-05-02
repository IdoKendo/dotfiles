{ pkgs, ...}: {
  programs.zsh.enable = true;

  users = {
    users.idoslonimsky = {
      isNormalUser = true;
      description = "Ido Slonimsky";
      extraGroups = [ "docker" "networkmanager" "wheel" ];
      shell = pkgs.zsh;
      packages = with pkgs; [];
    };
  };

}
