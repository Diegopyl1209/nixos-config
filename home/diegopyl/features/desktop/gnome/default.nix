{
  pkgs,
  config,
  lib,
  ...
}:
with lib.hm.gvariant; {
  imports = [
    ../common
    ../common/wayland-wm
  ];

  home.packages = with pkgs; [
    adwaita-icon-theme
    gnome-calendar
    gnome-system-monitor
    gnome-weather
    gnome-calculator
    gnome-software # for flatpak
    gnomeExtensions.awesome-tiles
    gnomeExtensions.dash-to-dock
    gnomeExtensions.bluetooth-battery-meter
    gnomeExtensions.app-menu-is-back
  ];

  dconf.settings = {
    "org/gnome/desktop/search-providers" = {
      disabled = ["org.gnome.Boxes.desktop"];
      enabled = ["org.gnome.Weather.desktop"];
      sort-order = [
        "org.gnome.Contacts.desktop"
        "org.gnome.Documents.desktop"
        "org.gnome.Nautilus.desktop"
        "org.gnome.Calendar.desktop"
        "org.gnome.Calculator.desktop"
        "org.gnome.Software.desktop"
        "org.gnome.Settings.desktop"
        "org.gnome.clocks.desktop"
        "org.gnome.design.IconLibrary.desktop"
        "org.gnome.seahorse.Application.desktop"
        "org.gnome.Weather.desktop"
        "org.gnome.Boxes.desktop"
      ];
    };

    "org/gnome/desktop/session" = {
      idle-delay = mkUint32 0;
    };

    "org/gnome/shell/extensions/dash-to-dock" = {
      intellihide = false;
      hot-keys = false;
    };

    "org/gnome/shell/extensions/awesome-tiles" = {
      shortcut-tile-window-to-left = ["<Super>Left"];
      shortcut-tile-window-to-right = ["<Super>Right"];
      shortcut-tile-window-to-center = ["<Super>Up"];
      shortcut-align-window-to-center = ["<Super>Down"];
    };

    "org/gnome/desktop/wm/keybindings" = {
      close = ["<Alt>q"];
      move-to-workspace-1 = ["<Shift><Super>1"];
      move-to-workspace-2 = ["<Shift><Super>2"];
      move-to-workspace-3 = ["<Shift><Super>3"];
      move-to-workspace-4 = ["<Shift><Super>4"];
      move-to-workspace-5 = ["<Shift><Super>5"];
      switch-to-workspace-1 = ["<Super>1"];
      switch-to-workspace-2 = ["<Super>2"];
      switch-to-workspace-3 = ["<Super>3"];
      switch-to-workspace-4 = ["<Super>4"];
      switch-to-workspace-5 = ["<Super>5"];
      toggle-fullscreen = ["<Super>g"];
      maximize = ["<Super>x"];
      unmaximize = ["<Super>c"];
    };

    "org/gnome/shell/keybindings" = {
      switch-to-application-1 = [];
      switch-to-application-2 = [];
      switch-to-application-3 = [];
      switch-to-application-4 = [];
      switch-to-application-5 = [];
    };

    "org/gnome/desktop/wm/preferences" = {
      mouse-button-modifier = "<Super>";
      num-workspaces = 5;
      resize-with-right-button = true;
      focus-mode = "sloppy";
    };

    "org/gnome/mutter" = {
      dynamic-workspaces = false;
      edge-tiling = true;
      num-workspaces = 5;
      workspaces-only-on-primary = true;
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = ["/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"];
      mic-mute = ["AudioMicMute"];
      next = ["AudioNext"];
      play = ["AudioPlay"];
      previous = ["AudioPrev"];
      stop = ["AudioStop"];
      volume-down = ["AudioLowerVolume"];
      volume-up = ["AudioRaiseVolume"];

      home = ["<Super>e"];
      www = ["<Super>w"];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Super>Return";
      command = "alacritty";
      name = "term";
    };

    "org/gnome/settings-daemon/plugins/power" = {
      idle-dim = false;
      power-button-action = "interactive";
      sleep-inactive-ac-type = "nothing";
      sleep-inactive-battery-type = "nothing";
    };

    "org/gnome/shell" = {
      favorite-apps = [
        "zen.desktop"
        "Alacritty.desktop"
        "org.gnome.Nautilus.desktop"
        "code.desktop"
        #"legcord.desktop"
        "spotify.desktop"
        "steam.desktop"
        "page.kramo.Cartridges.desktop"
        "org.gnome.Software.desktop"
      ];
    };

    "org/gnome/shell/app-switcher" = {
      current-workspace-only = true;
    };

    "org/gnome/shell/keybindings" = {
      toggle-application-view = ["<Super>r"];
    };

    "system/locale" = {
      region = "es_MX.UTF-8";
    };
  };
}
