{...}: {
  services.caddy = {
    enable = true;
    virtualHosts."*.diegopyl.me, diegopyl.me".extraConfig = ''
      tls /var/lib/acme/diegopyl.me/cert.pem /var/lib/acme/diegopyl.me/key.pem
    '';
  };
  security.acme.certs."diegopyl.me".group = "caddy";
}
