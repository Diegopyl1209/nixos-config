{
  config,
  lib,
  ...
}: let
  data_dir = "${config.nixos.services.server.dataDir}/Vaultwarden";
in {
  options.nixos.services.server.vaultwarden.enable = lib.mkEnableOption "Enable Vaultwarden";
  
  config = lib.mkIf config.nixos.services.server.vaultwarden.enable {
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
        SIGNUPS_ALLOWED = "true"; # change to allow register
      };
      extraOptions = [
        "--pull=always"
        # "--network=host"
      ];
    };

    services.caddy.virtualHosts = {
      "vaultwarden.diegopyl.me".extraConfig = ''
        reverse_proxy :8222
        tls /var/lib/acme/diegopyl.me/cert.pem /var/lib/acme/diegopyl.me/key.pem
      '';
    };
  };
}
