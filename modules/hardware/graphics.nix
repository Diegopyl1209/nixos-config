{
  pkgs,
  lib,
  config,
  ...
}: {
  options.nixos.hardware.graphics.enable = lib.mkEnableOption "Enable Graphics";

  config = lib.mkIf config.nixos.hardware.graphics.enable {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        libva
        vaapiVdpau
        libvdpau-va-gl
        amdvlk
        mesa
      ];
      extraPackages32 = with pkgs.pkgsi686Linux; [
        vaapiVdpau
        libvdpau-va-gl
        amdvlk
      ];
    };
  };
}
