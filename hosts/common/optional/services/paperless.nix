{config, ...}: {
  services.paperless = {
    enable = true;
    dataDir = "${config.server.dataDir}/paperless";
    port = 8444;
  };

  services.caddy = {
    virtualHosts."paperless.diegopyl.me" = {
      extraConfig = ''
        reverse_proxy :8444
        tls /var/lib/acme/diegopyl.me/cert.pem /var/lib/acme/diegopyl.me/key.pem
     '';
    };
  };
}
