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
      nvidia.enable = true;
    };
    programs = {
      agenix.enable = true;
      steam.enable = true;
      wine.enable = true;
      noisetorch.enable = true;
      xdg.enable = true;
    };
    services = {
      gdm.enable = true;
      pipewire.enable = true;
      tailscale.enable = true;
      server = {
        dataDir = "/run/media/hdd1/Server/Data";
        mediaDir = "/run/media/hdd1/Server/Media";
        acme.enable = true;
        caddy.enable = true;
        shoko.enable = true;
        jellyfin.enable = true;
        autobrr.enable = true;
        freshrss.enable = true;
        transmission.enable = true;
        vaultwarden.enable = true;
      };
    };
  };

  fileSystems = {
    "/run/media/sdd1" = {
      device = "/dev/disk/by-uuid/f21baeb8-c8e3-4193-b0a1-42d426b52136";
      fsType = "ext4";
    };
    "/run/media/hdd1" = {
      device = "/dev/disk/by-uuid/db269432-9ba6-4c6f-945c-1c24606b224d";
      fsType = "ext4";
    };
    "/run/media/hdd2" = {
      device = "/dev/disk/by-uuid/a9a2a4d3-43ad-42f4-b6e7-4b31f80feca4";
      fsType = "btrfs";
    };
  };

  virtualisation.docker = {
    enable = true;
  };

  services.flatpak.enable = true;
}
