{config, ...}: let
  data_folder = "${config.server.dataDir}/Shoko";
  media_folder = "${config.server.mediaDir}/R18";
  downloads_folder = "${config.server.mediaDir}/download";
in {
  virtualisation.oci-containers.containers.shoko = {
    image = "ghcr.io/shokoanime/server:latest";
    ports = [
      "8111:8111"
    ];
    volumes = [
      "${data_folder}:/home/shoko/.shoko"
      "${media_folder}:/mnt/r18"
      "${downloads_folder}:/mnt/downloads"
    ];
    extraOptions = [
      "--pull=always"
      # "--network=host"
    ];
  };

  services.caddy.virtualHosts."shoko.diegopyl.me".extraConfig = ''
    reverse_proxy :8111
    tls /var/lib/acme/diegopyl.me/cert.pem /var/lib/acme/diegopyl.me/key.pem
  '';
}
