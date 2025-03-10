{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t490
    inputs.nixos-hardware.nixosModules.common-pc-ssd

    ./hardware-configuration.nix

    ../common/global
    ../common/users/diegopyl

    ../common/optional/gnome.nix
    ../common/optional/pipewire.nix
    ../common/optional/quietboot.nix
    ../common/optional/nginx.nix
    ../common/optional/steam.nix
  ];

  environment.systemPackages = with pkgs; [
    hello
  ];
  networking = {
    hostName = "laptop";
  };
  services.flatpak.enable = true;
  programs.java.enable = true;

  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_xanmod_latest;
  };

  programs = {
    adb.enable = true;
    dconf.enable = true;
  };

  hardware.graphics.enable = true;
  system.stateVersion = "22.05";
}
