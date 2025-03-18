{inputs, ...}: {
  imports = [
    inputs.nixos-hardware.nixosModules.common-gpu-amd
  ];

  server = {
    enable = true;
    dataDir = "/run/media/hdd1/Server/Data";
    mediaDir = "/run/media/hdd1/Server/Media";
  };

  programs.ssh.startAgent = true;
  services.qemuGuest.enable = true;

  fileSystems."/run/media/hdd1" = {
    device = "/dev/disk/by-uuid/1d8863bd-af61-4214-993d-bec7b5f0c0bf";
    fsType = "ext4";
  };
}
