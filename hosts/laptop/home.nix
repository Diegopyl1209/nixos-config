{...}: {
  home-manager = {
    graphical.enable = true;
    colorscheme = "gruvbox";
    wallpaper = "samurai.jpg";
    hyprland = {
      enable = false;
    };
    gnome.enable = true;
    steam.enable = true;
    gdm.enable = true;
    tuigreet.enable = false;
  };
}
