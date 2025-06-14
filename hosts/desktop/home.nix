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
        mangohud.enable = true;
      };
      zen-browser.enable = true;
      github-desktop.enable = true;
      legcord.enable = true;
      gnome.enable = true;
      xdg.enable = true;
    };
    services = {
      kdeconnect.enable = true;
      polkit-agent.enable = true;
    };
  };
}
