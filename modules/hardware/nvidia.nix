{
  config,
  pkgs,
  lib,
  ...
}: {
  options.nixos.hardware.nvidia.enable = lib.mkEnableOption "Enable Nvidia drivers";

  config = lib.mkIf config.nixos.hardware.nvidia.enable {
    hardware.graphics = {
      extraPackages = with pkgs; [
        nvidia-vaapi-driver
      ];
    };

    boot = {
      kernelParams = ["nvidia-drm.fbdev=1"];
    };

    services.xserver.videoDrivers = ["nvidia"];

    hardware.nvidia = {
      modesetting.enable = true;
      open = true;
      package = config.boot.kernelPackages.nvidiaPackages.beta;
      nvidiaSettings = true;
    };
  };
}
