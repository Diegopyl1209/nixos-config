{pkgs, lib, config, username, ...}: {
  options.nixos.services.server.transmission.enable = lib.mkEnableOption "Enable Transmission";

  config = lib.mkIf config.nixos.services.server.transmission.enable {
    services.transmission = {
      enable = true;
      user = username;
      group = "media";
      package = pkgs.transmission_4;
      settings = {
        download-dir = "${config.nixos.services.server.mediaDir}/download";
        incomplete-dir = "${config.nixos.services.server.mediaDir}/download/.incomplete";
        rpc-bind-address = "100.111.84.83";
        rpc-port = 9091;
        rcp-whitelist-enabled = 0;
        rpc-whitelist = "*.*.*.*";
      };
    };
  };
}
