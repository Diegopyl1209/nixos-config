{
  inputs,
  lib,
  pkgs,
  config,
  ...
}: {
  imports = [
    ./gruvbox.nix
  ];
  stylix = {
    enable = true;
    autoEnable = false;
    polarity = "dark";
    image = ./wallpapers/${config.wallpaper};
    base16Scheme = "${config.scheme.outPath}";
    targets = {
      alacritty.enable = true;
      kitty.enable = true;
      gtk.enable = true;
      helix.enable = true;
      bat.enable = true;
      gnome.enable = true;
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
