{ ... }:
let
  mediaToolsModule =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        ffmpeg
        (if stdenv.hostPlatform.isDarwin then vlc-bin else vlc)
      ];
    };
in
{
  flake.modules.nixos.media-tools = mediaToolsModule;
  flake.modules.darwin.media-tools = mediaToolsModule;
}
