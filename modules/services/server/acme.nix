{
  config,
  useremail,
  lib,
  self,
  ...
}: {
  options.nixos.services.server.acme.enable =
    lib.mkEnableOption "Enable Acme";

  config = lib.mkIf config.nixos.services.server.acme.enable {
    age.secrets.cloudflare_token.file = "${self}/secrets/cloudflare_token.age";
    # Enable acme for usage with nginx vhosts
    security.acme = {
      defaults.email = "${useremail}";
      acceptTerms = true;
      certs."diegopyl.me" = {
        dnsProvider = "cloudflare";
        environmentFile = config.age.secrets.cloudflare_token.path;
        extraDomainNames = [
          "*.diegopyl.me"
        ];
      };
    };
  };
}
