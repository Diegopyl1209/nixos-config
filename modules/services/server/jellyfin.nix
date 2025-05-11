{
  username,
  config,
  lib,
  pkgs,
  ...
}: {
  options.nixos.services.server.jellyfin.enable = lib.mkEnableOption "Enable jellyfin";
  config = lib.mkIf config.nixos.services.server.jellyfin.enable {
    services = {
      jellyfin = {
        enable = true;
        user = username;
        openFirewall = true;
        dataDir = "${config.nixos.services.server.dataDir}/jellyfin/dataDir";
        configDir = "${config.nixos.services.server.dataDir}/jellyfin/configDir";
      };
    };

    environment.systemPackages = with pkgs; [
      jellyfin
      jellyfin-web
      jellyfin-ffmpeg
    ];

    services.caddy.virtualHosts."jellyfin.diegopyl.me".extraConfig = ''
      reverse_proxy :8096
      tls /var/lib/acme/diegopyl.me/cert.pem /var/lib/acme/diegopyl.me/key.pem
    '';
  };
}
