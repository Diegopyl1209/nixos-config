{
  config,
  lib,
  ...
}: let
  data_dir = "${config.server.dataDir}/Vaultwarden";
in {
  options.server.vaultwarden.enable =
    lib.mkEnableOption "Enable Vaultwarden"
    // {
      default = config.server.enable;
    };
  config = lib.mkIf config.server.vaultwarden.enable {

    virtualisation.oci-containers.containers.vaultwarden = {
      image = "vaultwarden/server:latest";
      ports = [
        "127.0.0.1:8222:80"
      ];
      volumes = [
        "${data_dir}:/data"
      ];
      environment = {
        DOMAIN = "https://vaultwarden.diegopyl.me";
        SIGNUPS_ALLOWED = "false"; # change to allow register
      };
      extraOptions = [
        "--pull=always"
        # "--network=host"
      ];
    };
    /*services.vaultwarden = {
      enable = true;
      backupDir = backup_dir;
      config = {
        ROCKET_ADDRESS = "127.0.0.1";
        ROCKET_PORT = 8222;
      };
    }; */

    services.caddy.virtualHosts = {
      "vaultwarden.diegopyl.me".extraConfig = ''
        reverse_proxy :8222
        tls /var/lib/acme/diegopyl.me/cert.pem /var/lib/acme/diegopyl.me/key.pem
      '';
    };
  };
}
