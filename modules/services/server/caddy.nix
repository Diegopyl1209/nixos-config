{
  config,
  lib,
  ...
}: {
  options.nixos.services.server.caddy.enable =
    lib.mkEnableOption "Enable Caddy";

  config = lib.mkIf config.nixos.services.server.caddy.enable {
    services.caddy = {
      enable = true;
    };
    security.acme.certs."diegopyl.me".group = "caddy";
  };
}
