{ ... }:
{
  flake.modules.nixos.clipboard =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        xclip
      ];
    };
}
