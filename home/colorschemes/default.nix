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
    inputs.stylix.homeModules.stylix
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

    home.packages = [
      pkgs.dejavu_fonts
      pkgs.nerd-fonts.jetbrains-mono
      pkgs.noto-fonts-emoji
    ];

    stylix.fonts = {
      serif = {
        name = "DejaVu Serif";
      };
      sansSerif = {
        name = "DejaVu Sans Condensed";
      };
      monospace = {
        name = "JetBrainsMono Nerd Font Mono";
      };
      emoji = {
        name = "Noto Color Emoji";
      };
    };
  };
}
