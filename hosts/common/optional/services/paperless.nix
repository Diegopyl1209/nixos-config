{config, ...}: {
  services.paperless = {
    enable = true;
    dataDir = "${config.server.dataDir}/paperless";
    port = 8444;
  };

  services.caddy = {
    virtualHosts."http://paperless.server.hs" = {
      extraConfig = ''
        reverse_proxy :8444
      '';
    };
  };
}
