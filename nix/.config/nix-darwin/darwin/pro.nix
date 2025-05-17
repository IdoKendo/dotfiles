{ ... }: {
  imports = [
    ./configuration.nix
  ];

  # Installs base packages
  packages.enable = true;

  # Installs darwin specific packages
  darwinpackages.enable = true;

  # Install all kubernetes related packages
  kubernetes.enable = true;
}
