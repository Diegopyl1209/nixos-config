{
  lib,
  config,
  ...
}: {
  options.nixos.services.gdm.enable = lib.mkEnableOption "Enable GDM";

  config = lib.mkIf config.nixos.services.gdm.enable {
    services.xserver = {
      enable = true;
      displayManager.gdm.enable = true;
    };
  };
}
