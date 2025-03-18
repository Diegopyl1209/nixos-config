{
  username,
  inputs,
  ...
}: {
  imports = [
    inputs.nixos-hardware.nixosModules.common-cpu-amd
    inputs.nixos-hardware.nixosModules.common-cpu-amd-zenpower
    inputs.nixos-hardware.nixosModules.common-cpu-amd-pstate
    inputs.nixos-hardware.nixosModules.common-pc-ssd
  ];

  programs.java.enable = true;

  server.enable = false;

  nixos = {
    amdgpu.enable = false;
    nvidia = {
      version = "beta";
      enable = true;
    };
  };

  fileSystems = {
    "/run/media/sdd1" = {
      device = "/dev/disk/by-uuid/9084fb93-9cee-4f6e-a672-7fe74e461680";
      fsType = "ext4";
    };
    "/run/media/hdd1" = {
      device = "/dev/disk/by-uuid/a9a2a4d3-43ad-42f4-b6e7-4b31f80feca4";
      fsType = "btrfs";
    };
  };
}
