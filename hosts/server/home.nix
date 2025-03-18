{ lib, ... }:
{
  home-manager = {
    graphical.enable = false;

    wallpaper = "samurai.jpg";
    colorscheme = "gruvbox";
  };

  #https://github.com/danth/stylix/pull/912
  stylix.enable = lib.mkDefault true;
}
