{
  pkgs,
  lib,
  config,
  ...
}: {
  options.nixos.hardware.bluetooth.enable = lib.mkEnableOption "Enable Bluetooth";

  config = lib.mkIf config.nixos.hardware.bluetooth.enable {
    hardware.bluetooth = {
      enable = true;
      package = pkgs.bluez-experimental;
      settings = {
        # make Xbox Series X controller work
        General = {
          Experimental = true;
          FastConnectable = true;
          powerOnBoot = false;
          JustWorksRepairing = "always";
          Privacy = "device";
        };
      };
    };

    boot.extraModprobeConfig = ''options bluetooth disable_ertm=1 '';
    systemd.user.services.telephony_client.enable = false;
  };
}
