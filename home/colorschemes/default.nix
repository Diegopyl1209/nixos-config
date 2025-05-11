{
  lib,
  pkgs,
  config,
  inputs,
  ...
}: {
  options.home-manager.colorschemes = {
    enable = lib.mkEnableOption "Enable Stylix";
    colorscheme = lib.mkOption {
      type = lib.types.enum ["gruvbox"];
      default = "gruvbox";
    };
    wallpaper = lib.mkOption {
      type = lib.types.str;
    };
  };

  imports = [
    inputs.base16.nixosModule
    inputs.stylix.homeManagerModules.stylix
    ./gruvbox.nix
  ];

  config = lib.mkIf config.home-manager.colorschemes.enable {
    stylix = {
      enable = true;
      autoEnable = false;
      polarity = "dark";
      image = ../../wallpapers/${config.home-manager.colorschemes.wallpaper};
      base16Scheme = "${config.scheme.outPath}";
      targets = {
        alacritty.enable = true;
        gtk.enable = true;
        helix.enable = true;
        bat.enable = true;
        gnome.enable = true;
        yazi.enable = true;
        zed.enable = true;
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
  };
}
