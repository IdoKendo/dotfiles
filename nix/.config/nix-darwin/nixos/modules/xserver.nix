{
  # Enable the GNOME Desktop Environment.
  services.desktopManager.gnome.enable = true;
  services.displayManager.gdm.enable = true;

  services.xserver = {
    enable = true;


    # Configure keymap in X11
    xkb = {
      layout = "us";
      variant = "";
    };

    # Enable touchpad support (enabled default in most desktopManager).
    # libinput.enable = true;
  };
}
