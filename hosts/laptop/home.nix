_: {
  home-manager = {
    colorschemes = {
      enable = true;
      colorscheme = "gruvbox";
      wallpaper = "samurai.jpg";
    };
    programs = {
      editors = {
        emacs.enable = true;
        vscode.enable = true;
        helix.enable = true;
      };
      media = {
        enable = true;
        mpv.enable = true;
        spotify.enable = false;
      };
      games = {
        enable = true;
        runelite.enable = true;
        mangohud.enable = false;
      };
      zen-browser.enable = true;
      discord.enable = true;
      gnome.enable = true;
      xdg.enable = true;
    };
    services = {
      kdeconnect.enable = false;
      polkit-agent.enable = true;
    };
  };
}
