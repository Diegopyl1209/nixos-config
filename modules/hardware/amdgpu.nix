{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.nixos.amdgpu.enable {
    boot = {
      initrd = {
        kernelModules = [
          "amdgpu"
          "dm-snapshot"
        ];
      };
    };
    hardware = {
      graphics = {
        extraPackages = with pkgs; [
          amdvlk
          vaapiVdpau
          libvdpau-va-gl
        ];
      };
    };
  };
}
