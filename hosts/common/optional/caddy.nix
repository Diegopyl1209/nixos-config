{...}: {
  services.caddy = {
    enable = true;
  };
  security.acme.certs."diegopyl.me".group = "caddy";
}
