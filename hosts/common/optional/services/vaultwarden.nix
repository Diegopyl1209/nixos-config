{
  config,
  lib,
  ...
}: let
  backup_dir = "${config.server.dataDir}/Vaultwarden/backup";
in {

  networking.firewall = {
    allowedTCPPorts = [ 8222 ];
  };
  
  services.vaultwarden = {
    enable = true;
    backupDir = backup_dir;
    config = {
      ROCKET_ADDRESS = "https://vaultwarden.diegopyl.duckdns.org";
      ROCKET_PORT = 8222;
    };
  };

  /*services.caddy.virtualHosts."server.local.com:8223".extraConfig = ''
    reverse_proxy http://127.0.0.1:8222
    tls internal
  ''; */
}
