{
  pkgs,
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.hm.home-manager.gnome.enable {
    services = {
      xserver = {
        enable = true;
        desktopManager.gnome = {
          enable = true;
        };
        displayManager.gdm = {
          # enabled in display-manager.nix
          autoSuspend = false;
        };
      };
    };

    programs.nautilus-open-any-terminal = {
      enable = true;
      terminal = "alacritty";
    };

    environment = {
      systemPackages = with pkgs; [
        nautilus
        nautilus-python
      ];

      gnome.excludePackages = with pkgs; [
        gnome-console
        gnome-photos
        gnome-tour
        gnome-connections
        cheese # webcam tool
        epiphany # web browser
        geary # email reader
        evince # document viewer
        totem # video player
        yelp # Help view
        gnome-font-viewer
        gnome-music
        gnome-characters
        tali # poker game
        iagno # go game
        hitori # sudoku game
        atomix # puzzle game
        gnome-contacts
        gnome-initial-setup
        gnome-shell-extensions
        gnome-maps
      ];
    };
  };
}
