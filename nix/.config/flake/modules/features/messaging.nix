{ ... }:
let
  messagingModule =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.telegram-desktop ];
    };
in
{
  flake.modules.nixos.messaging = messagingModule;
  flake.modules.darwin.messaging = messagingModule;
}
