{
  pkgs,
  lib,
  ...
}: {
  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_xanmod_latest; # TODO: make a option to change this

    loader.grub = {
      enable = lib.mkForce true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
    };

    loader.efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };

    plymouth.enable = true; # TODO: make a option to disable this
  };
}
