{
  lib,
  pkgs,
  config,
  ...
}: {
  imports = [
    ./gruvbox.nix
  ];
    stylix = {
      enable = config.home-manager.graphical.enable;
      autoEnable = false;
      polarity = "dark";
      image = ../desktop/wallpapers/${config.home-manager.wallpaper};
      base16Scheme = "${config.scheme.outPath}";
      targets = {
        alacritty.enable = true;
        gtk.enable = true;
        helix.enable = true;
        bat.enable = true;
        gnome.enable = true;
        #nixvim.enable = true;
      };
    };

    stylix.cursor = {
      name = "phinger-cursors-dark";
      package = pkgs.phinger-cursors;
      size = 16;
    };

    stylix.fonts = {
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans Condensed";
      };
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font Mono";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };
}
