{ ... }:
{
  imports = [
    ./configuration.nix
  ];

  # Installs base packages
  packages.enable = true;

  # Installs darwin specific packages
  darwinpackages.enable = true;

  # Don't install kubernetes related packages
  kubernetes.enable = false;
}
