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
        spotify.enable = true;
      };
      games = {
        enable = true;
        runelite.enable = true;
        mangohud.enable = true;
      };
      zen-browser.enable = true;
      github-desktop.enable = true;
      discord.enable = true;
      gnome.enable = true;
      niri.enable = true;
      anyrun.enable = true;
      waybar.enable = true;
      xdg.enable = true;
    };
    services = {
      kdeconnect.enable = true;
      polkit-agent.enable = true;
    };
  };
}
