{
  pkgs,
  username,
  ...
}: {
  environment.systemPackages = with pkgs; [
    age
    sops
  ];
  sops = {
    defaultSopsFile = ../hosts/secrets.yaml;
    age.sshKeyPaths = ["/home/${username}/.ssh/id_ed25519"];
  };
}
