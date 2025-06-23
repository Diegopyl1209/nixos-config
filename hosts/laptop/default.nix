{inputs, ...}: {
  imports = [
    inputs.nixos-hardware.nixosModules.common-cpu-amd
    inputs.nixos-hardware.nixosModules.common-cpu-amd-zenpower
    inputs.nixos-hardware.nixosModules.common-cpu-amd-pstate
    inputs.nixos-hardware.nixosModules.common-pc-ssd
  ];

  nixos = {
    network.enable = true;
    hardware = {
      bluetooth.enable = true;
      graphics.enable = true;
    };
    programs = {
      agenix.enable = false;
      steam.enable = true;
      wine.enable = true;
      noisetorch.enable = false;
      xdg.enable = true;
    };
    services = {
      gdm.enable = true;
      pipewire.enable = true;
      tailscale.enable = true;
    };
  };
}
