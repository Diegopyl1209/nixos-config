{
  config,
  lib,
  pkgs,
  utils,
  ...
}: let
  data_folder = "${config.server.dataDir}/autobrr";
  package = pkgs.autobrr;
  username = "diegopyl";
in {
  /*
    networking.firewall = {
    allowedTCPPorts = [7474];
  };
  */

  systemd.tmpfiles.rules = [
    "d '${data_folder}' 0700 ${username} users - -"
  ];

  systemd.services.autobrr = {
    description = "Autobrr";
    after = ["network.target"];
    wantedBy = ["multi-user.target"];

    serviceConfig = {
      Type = "simple";
      User = username;
      ExecStart = utils.escapeSystemdExecArgs [
        (lib.getExe package)
        "--config=${data_folder}"
      ];
      Restart = "on-failure";
    };
  };

  services.caddy.virtualHosts."autobrr.diegopyl.me".extraConfig = ''
    reverse_proxy :7474
    tls /var/lib/acme/diegopyl.me/cert.pem /var/lib/acme/diegopyl.me/key.pem
  '';
}
