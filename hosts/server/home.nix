{lib, ...}: {
  home-manager = {
    graphical.enable = false;

    wallpaper = "samurai.jpg";
    colorscheme = "gruvbox";

    hyprland = {
      enable = false;
    };
    gnome.enable = false;
  };

  #https://github.com/danth/stylix/pull/912
  stylix.enable = lib.mkDefault true;
}
