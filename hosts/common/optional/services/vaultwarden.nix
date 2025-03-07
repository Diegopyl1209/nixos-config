{config, ...}: let
  backup_dir = "${config.server.dataDir}/Vaultwarden/backup";
in {
  #networking.firewall.allowedTCPPorts = [ 8222 ];

  services.vaultwarden = {
    enable = true;
    backupDir = backup_dir;
    config = {
      ROCKET_ADDRESS = "127.0.0.1";
      ROCKET_PORT = 8222;
    };
  };

  services.caddy.virtualHosts = {
    "vaultwarden.diegopyl.me".extraConfig = ''
      reverse_proxy :8222
      tls /var/lib/acme/diegopyl.me/cert.pem /var/lib/acme/diegopyl.me/key.pem
    '';
  };
}
