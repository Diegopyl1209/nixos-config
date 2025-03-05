{
  config,
  pkgs,
  ...
}: let
  dockerEnabled = config.virtualisation.docker.enable;
in {
  virtualisation.podman = {
    enable = true;
    dockerCompat = !dockerEnabled;
    dockerSocket.enable = !dockerEnabled;
    defaultNetwork.settings.dns_enabled = true;
  };
  environment.systemPackages = [
    pkgs.podman-compose
    pkgs.arion
    pkgs.docker-client # needed for arion
  ];
}
