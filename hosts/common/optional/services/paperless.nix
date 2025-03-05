{config, ...}: {
  services.paperless = {
    enable = true;
    dataDir = "${config.server.dataDir}/paperless";
    port = 8444;    
  };
}
