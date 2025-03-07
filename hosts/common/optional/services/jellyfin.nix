{
  lib,
  config,
  pkgs,
  ...
}: {
  services = {
    jellyfin = {
      enable = true;
      user = "diegopyl";
      openFirewall = true;
      dataDir = "${config.server.dataDir}/jellyfin/dataDir";
      configDir = "${config.server.dataDir}/jellyfin/configDir";
    };

    #prowlarr.enable = true;
    /*
    sonarr = {
      enable = true;
      user = username;
      group = "media";
      openFirewall = true;
      dataDir = "${config.server.dataDir}/sonnar";
    };
    */
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
}
