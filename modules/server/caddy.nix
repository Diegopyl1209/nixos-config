{
  config,
  lib,
  ...
}: {
  options.server.caddy.enable =
    lib.mkEnableOption "Enable Caddy" // {default = config.server.enable;};

  config = lib.mkIf config.server.caddy.enable {
    services.caddy = {
      enable = true;
    };
    security.acme.certs."diegopyl.me".group = "caddy";
  };
}
