{ ... }:
{
  flake.modules.darwin.desktop-preferences = {
    system.defaults.loginwindow.LoginwindowText = "Ido S.\nPrincipal Software Engineer";

    system.defaults.finder = {
      AppleShowAllExtensions = true;
      AppleShowAllFiles = true;
      QuitMenuItem = true;
      _FXShowPosixPathInTitle = true;
    };

    system.defaults.NSGlobalDomain = {
      AppleShowAllExtensions = true;
      AppleShowAllFiles = true;
      InitialKeyRepeat = 25;
      KeyRepeat = 2;
      _HIHideMenuBar = true;
    };

    system.defaults.dock.autohide = true;
  };
}
