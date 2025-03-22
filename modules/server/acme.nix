{
  config,
  useremail,
  lib,
  ...
}: {
  options.server.acme.enable =
    lib.mkEnableOption "Enable Acme" // {default = config.server.enable;};

  config = lib.mkIf config.server.acme.enable {
    # Enable acme for usage with nginx vhosts
    security.acme = {
      defaults.email = "${useremail}";
      acceptTerms = true;
      certs."diegopyl.me" = {
        dnsProvider = "cloudflare";
        environmentFile = config.sops.secrets.cloudflare_token.path;
        extraDomainNames = [
          "*.diegopyl.me"
        ];
      };
    };
    sops.secrets.cloudflare_token = {};
  };
}
