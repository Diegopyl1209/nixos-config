{lib, ...}: {
  imports = [
    ./acme.nix
    ./caddy.nix
    ./shoko.nix
    ./jellyfin.nix
    ./autobrr.nix
    ./transmission.nix
    ./freshrss.nix
  ];

  options.nixos.services.server = {
    dataDir = lib.mkOption {
      type = lib.types.str;
      description = "Data dir for services";
    };
    mediaDir = lib.mkOption {
      type = lib.types.str;
      description = "Media dir for services";
    };
  };
}
