{
  pkgs,
  lib,
  config,
  ...
}: {
  options.home-manager.programs.games.runelite.enable = lib.mkEnableOption "Enable Runelite";

  config = lib.mkIf config.home-manager.programs.games.runelite.enable {
    home.packages = [
      pkgs.runelite
    ];

    xdg.desktopEntries = {
      "RuneLite" = {
        exec = "runelite %u";
        icon = "net.runelite.RuneLite";
        name = "RuneLite";
        categories = [
          "Game"
        ];
      };
    };
  };
}
