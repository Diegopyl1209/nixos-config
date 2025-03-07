{config, ...}:{
  # Enable acme for usage with nginx vhosts
  security.acme = {
    defaults.email = "diegopyl1209@gmail.com";
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
}
