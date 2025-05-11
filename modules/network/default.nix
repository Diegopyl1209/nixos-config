{
  pkgs,
  lib,
  config,
  host,
  ...
}: {
  options.nixos.network.enable = lib.mkEnableOption "Enable networkmanager";

  config = lib.mkIf config.nixos.network.enable {

    networking = {
      hostName = host;
      networkmanager = {
        enable = true;
        dns = "systemd-resolved";
        wifi.powersave = true;
      }; 
    };
    

    services = {
      # DNS resolver
      resolved = {
        enable = true;
        dnsovertls = "opportunistic";
      };
    };

    # Don't wait for network startup
    systemd.services.NetworkManager-wait-online.serviceConfig.ExecStart = [
      ""
      "${pkgs.networkmanager}/bin/nm-online -q"
    ];
  };
}
