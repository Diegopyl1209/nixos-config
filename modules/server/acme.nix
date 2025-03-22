{ config, useremail, ... }:
{
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
  sops.secrets.cloudflare_token = { };
}
