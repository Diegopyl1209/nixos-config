{
  username,
  config,
  lib,
  pkgs,
  ...
}: {
  options.server.jellyfin.enable =
    lib.mkEnableOption "Enable jellyfin"
    // {
      default = config.server.enable;
    };
  config = lib.mkIf config.server.jellyfin.enable {
    services = {
      jellyfin = {
        enable = true;
        user = username;
        openFirewall = true;
        dataDir = "${config.server.dataDir}/jellyfin/dataDir";
        configDir = "${config.server.dataDir}/jellyfin/configDir";
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
