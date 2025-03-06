{
  config,
  ...
}:
let
  backup_dir = "${config.server.dataDir}/Vaultwarden/backup";
in
{
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
    "http://server.hs:8224".extraConfig = ''
      reverse_proxy http://127.0.0.1:8222
    '';
    "server.hs:8223".extraConfig = ''
      reverse_proxy http://127.0.0.1:8222
      tls internal
    '';
  };
}
