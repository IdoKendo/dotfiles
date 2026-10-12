{ ... }:
let
  documentsModule =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        ghostscript
        obsidian
        presenterm
      ];
    };
in
{
  flake.modules.nixos.documents = documentsModule;
  flake.modules.darwin.documents = documentsModule;
}
