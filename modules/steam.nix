{
  config,
  pkgs,
  ...
}: {
  programs.steam = {
    enable = config.hm.home-manager.steam.enable;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };
}
