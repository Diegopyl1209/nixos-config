{
  lib,
  host,
  ...
}: {
  options.home-manager = {
    backlight.enable =
      lib.mkEnableOption "Backlight"
      // {
        default = host == "laptop";
      };
    battery.enable =
      lib.mkEnableOption "Battery"
      // {
        default = host == "laptop";
      };
    bluetooth.enable =
      lib.mkEnableOption "Bluetooth"
      // {
        default = host != "server";
      };
  };
}
