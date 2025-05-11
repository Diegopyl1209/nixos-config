{
  pkgs,
  lib,
  config,
  ...
}: {
  options.home-manager.programs.games.enable = lib.mkEnableOption "Enable games related software";

  imports = [
    ./mangohud.nix
    ./runelite.nix
  ];

  config = lib.mkIf config.home-manager.programs.games.enable {
    home.packages = with pkgs; [
      prismlauncher
      heroic
      (tetrio-desktop.overrideAttrs (_: {
        withTetrioPlus = true;
      }))
    ];
  };
}
