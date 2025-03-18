{
  lib,
  host,
  pkgs,
  pkgsStable,
  config,
  inputs,
  system,
  username,
  ...
}: {
  # User
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "video"
      "networkmanager"
      "adbusers"
      "kvm"
    ];
    shell = pkgs.fish;
    packages = [pkgs.home-manager];
  };

  environment.sessionVariables = {
    FLAKE = "/home/${username}/nixos-config";
  };

  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_xanmod_latest;
    # Bootloader.
    loader.grub = {
      enable = lib.mkForce true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
      extraConfig = "
        terminal_input console
        terminal_output console
      ";
    };

    loader.efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };

    plymouth.enable = true;
  };

  # Bash shebang
  services.envfs.enable = true;

  # Set default terminal
  xdg.terminal-exec = {
    enable = true;
    settings = {
      default = [ "alacritty.desktop" ];
    };
  };

  services.tailscale.enable = true;

  hardware.graphics.enable = true;
  hardware.bluetooth = {
    enable = config.hm.home-manager.bluetooth.enable;
    powerOnBoot = false;
  };

  programs.adb.enable = true;
  programs.dconf.enable = true;
  virtualisation.docker.enable = true;

  # Networking
  networking = {
    hostName = "${host}";
    networkmanager.enable = true;
    firewall.enable = lib.mkForce true;
  };
  
  # Printing support
  services.printing = {
    enable = true;
    browsed.enable = false;
    openFirewall = true;
  };

  security.polkit.enable = true;
  services.flatpak.enable = true;

  # Sound
  security.rtkit.enable = true;
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Locate
  services.locate = {
    enable = true;
  };

  # Enable the OpenSSH daemon
  services.openssh = {
    enable = true;
    ports = [22];
    settings = {
      PasswordAuthentication = true;
      AllowUsers = null;
      UseDns = true;
      PermitRootLogin = "prohibit-password";
    };
  };

  # Locale
  time.timeZone = "America/Santiago";

  # Internationalisation
  i18n.defaultLocale = "es_MX.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_CL.UTF-8";
    LC_IDENTIFICATION = "es_CL.UTF-8";
    LC_MEASUREMENT = "es_CL.UTF-8";
    LC_MONETARY = "es_CL.UTF-8";
    LC_NAME = "es_CL.UTF-8";
    LC_NUMERIC = "es_CL.UTF-8";
    LC_PAPER = "es_CL.UTF-8";
    LC_TELEPHONE = "es_CL.UTF-8";
    LC_TIME = "es_CL.UTF-8";
  };

  # Nixos docs
  documentation = {
    nixos.enable = false;
    info.enable = false;
    man.enable = false;
  };

  # System stateversion
  system.stateVersion = "23.05";
}
