{
  config,
  lib,
  ...
}: let
  data_folder = "${config.nixos.services.server.dataDir}/Freshrss";
in {
  options.nixos.services.server.freshrss.enable = lib.mkEnableOption "Enable Freshrss";
  config = lib.mkIf config.server.freshrss.enable {
    virtualisation.oci-containers.containers.freshrss = {
      image = "freshrss/freshrss:latest";
      ports = [
        "8220:80"
      ];
      environment = {
        TZ = "Santiago/Chile";
        CRON_MIN = "3,33";
        TRUSTED_PROXY = "100.111.84.83/16";
      };
      volumes = [
        "${data_folder}/config:/config"
        "${data_folder}/data:/var/www/FreshRSS/data"
        "${data_folder}/extensions:/var/www/FreshRSS/extensions"
      ];
    };
    services.caddy.virtualHosts."freshrss.diegopyl.me".extraConfig = ''
      reverse_proxy :8220
      tls /var/lib/acme/diegopyl.me/cert.pem /var/lib/acme/diegopyl.me/key.pem
    '';
  };
}
