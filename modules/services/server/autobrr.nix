{
  config,
  lib,
  pkgs,
  utils,
  username,
  ...
}: let
  data_folder = "${config.nixos.services.server.dataDir}/autobrr";
  package = pkgs.autobrr;
in {
  options.server.autobrr.enable = lib.mkEnableOption "Enable Autobrr";
  config = lib.mkIf config.nixos.services.server.autobrr.enable {
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
  };
}
