{...}: {
  imports = [
    ./boot.nix
    ./security.nix
    ./user.nix
  ];

  services.envfs.enable = true;

  time.timeZone = "America/Santiago";
  i18n = {
    defaultLocale = "es_MX.UTF-8";
    extraLocaleSettings = {
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
  };
  console.keyMap = "la-latin1";

  system.stateVersion = "24.11";
}
