{pkgs, ...}: {
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
}
