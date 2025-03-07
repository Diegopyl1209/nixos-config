{
  pkgs,
  lib,
  config,
  ...
}: {
  services.qbittorrent = {
    enable = true;
    openFirewall = true;
    port = 9092;
    user = "diegopyl";
    dataDir = "${config.server.dataDir}/Qbittorrent";
  };

  services.caddy.virtualHosts."qbittorrent.diegopyl.me".extraConfig = ''
    reverse_proxy :9092
    tls /var/lib/acme/diegopyl.me/cert.pem /var/lib/acme/diegopyl.me/key.pem
  '';
}
