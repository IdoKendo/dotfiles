{ ... }:
{
  flake.modules.nixos."features-packages-nixos" =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        brave
        xclip
      ];
    };
}
