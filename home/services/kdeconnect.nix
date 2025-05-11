{
  lib,
  config,
  ...
}: {
  options.home-manager.services.kdeconnect.enable = lib.mkEnableOption "Enable KDEconnect";

  config = lib.mkIf config.home-manager.services.kdeconnect.enable {
    services.kdeconnect = {
      enable = true;
      indicator = true;
    };

    systemd.user.services = {
      kdeconnect.Unit.After = lib.mkForce ["graphical-session.target"];
      kdeconnect-indicator.Unit.After = lib.mkForce ["graphical-session.target"];
    };
  };
}
