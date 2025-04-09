{ pkgs, lib, config, ... }: {
  options = {
    kubernetes.enable =
      lib.mkEnableOption "includes kubernetes related packages";
  };

  config = lib.mkIf config.kubernetes.enable {
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
}
