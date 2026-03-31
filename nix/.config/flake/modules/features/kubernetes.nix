{ ... }:
let
  kubernetesModule =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        aws-iam-authenticator
        eksctl
        k9s
        kind
        kubebuilder
        kubecolor
        kubectl
        kubectx
        kubernetes-helm
        stern
      ];
    };
in
{
  flake.nixosModules."features-kubernetes" = kubernetesModule;
  flake.darwinModules."features-kubernetes" = kubernetesModule;
}
