{
  inputs,
  config,
  pkgs,
  lib,
  ...
}: {
  options.home-manager.programs.niri.enable = lib.mkEnableOption "Enable Niri Config";

  imports = [
    inputs.niri.homeModules.niri
  ];

  config = lib.mkIf config.home-manager.programs.niri.enable {
    home.packages = with pkgs; [
      wl-clipboard
      swww
      xwayland-satellite
      mako
    ];

    programs.niri = {
      enable = true;
      package = pkgs.niri;
      settings = {
        spawn-at-startup = [
          #{command = "hyprlock";}
          {command = ["waybar"];}
          {command = ["mako"];}
          {command = ["xwayland-satellite"];}
          {command = ["swww-daemon"];}
          {command = ["wl-paste" "--watch" "cliphist" "store"];}
          {command = ["wl-paste" "--type text" "--watch" "cliphist" "store"];}
        ];
        environment = {
          "DISPLAY" = ":0";
        };
        outputs = {
          "HDMI-A-1" = {
            focus-at-startup = true;
            scale = 1.0;
            position = {
              x = 0;
              y = 0;
            };
          };
          "HDMI-A-2" = {
            scale = 1.0;
            position = {
              x = 1920;
              y = 330;
            };
          };
        };
        input = {
          keyboard.xkb.layout = "latam";
          touchpad = {
            click-method = "button-areas";
            dwt = true;
            dwtp = true;
            natural-scroll = true;
            scroll-method = "two-finger";
            tap = true;
            tap-button-map = "left-right-middle";
            middle-emulation = true;
            accel-profile = "adaptive";
          };
          focus-follows-mouse.enable = true;
          warp-mouse-to-focus.enable = true;
          workspace-auto-back-and-forth = true;
        };
        screenshot-path = "~/Pictures/Screenshots/Screenshot-from-%Y-%m-%d-%H-%M-%S.png";
        overview = {
          # workspace-shadow = "off";
          backdrop-color = "transparent";
        };
        gestures = {
          hot-corners.enable = true;
        };
        cursor = {
          size = 16;
          theme = config.stylix.cursor.name;
        };
        layout = {
          focus-ring.enable = false;
          border = {
            enable = true;
            width = 1;
            active.color = "#7fb4ca";
            inactive.color = "#090e13";
          };
          shadow = {
            enable = true;
          };
          preset-column-widths = [
            {proportion = 0.25;}
            {proportion = 0.5;}
            {proportion = 0.75;}
            {proportion = 1.0;}
          ];
          default-column-width = {proportion = 0.5;};

          gaps = 6;
          struts = {
            left = 0;
            right = 0;
            top = 0;
            bottom = 0;
          };

          tab-indicator = {
            hide-when-single-tab = true;
            place-within-column = true;
            position = "left";
            corner-radius = 20.0;
            gap = -12.0;
            gaps-between-tabs = 10.0;
            width = 4.0;
            length.total-proportion = 0.1;
          };
        };
        prefer-no-csd = true;

        debug = {
          wait-for-frame-completion-in-pipewire = []; # empty array means enabled
        };

        binds = with config.lib.niri.actions; let
          set-volume = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@";
          brillo = spawn "${pkgs.brillo}/bin/brillo" "-q" "-u" "300000";
          playerctl = spawn "${pkgs.playerctl}/bin/playerctl";
        in {
          "XF86AudioMute".action = spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle";
          "XF86AudioMicMute".action = spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle";

          "XF86AudioPlay".action = playerctl "play-pause";
          "XF86AudioStop".action = playerctl "pause";
          "XF86AudioPrev".action = playerctl "previous";
          "XF86AudioNext".action = playerctl "next";

          "XF86AudioRaiseVolume".action = set-volume "5%+";
          "XF86AudioLowerVolume".action = set-volume "5%-";

          "XF86MonBrightnessUp".action = brillo "-A" "5";
          "XF86MonBrightnessDown".action = brillo "-U" "5";

          "Print".action.screenshot = {show-pointer = true;};
          "Alt+Print".action.screenshot = {show-pointer = false;};

          "Mod+D".action = spawn "${pkgs.anyrun}/bin/anyrun";
          "Mod+Return" = {
            repeat = false;
            action = spawn "alacritty";
          };

          "Alt+Q".action = close-window;
          "Mod+S".action = switch-preset-column-width;
          "Mod+F".action = maximize-column;
          "Mod+Shift+F".action = expand-column-to-available-width;
          "Mod+Space".action = toggle-window-floating;
          "Mod+W".action = toggle-column-tabbed-display;

          "Mod+Comma".action = consume-window-into-column;
          "Mod+Period".action = expel-window-from-column;
          "Mod+C".action = center-visible-columns;
          "Mod+Tab".action = switch-focus-between-floating-and-tiling;

          "Mod+Minus".action = set-column-width "-10%";
          "Mod+Plus".action = set-column-width "+10%";
          "Mod+Shift+Minus".action = set-window-height "-10%";
          "Mod+Shift+Plus".action = set-window-height "+10%";

          "Mod+H".action = focus-column-left;
          "Mod+L".action = focus-column-right;
          "Mod+J".action = focus-window-or-workspace-down;
          "Mod+K".action = focus-window-or-workspace-up;
          "Mod+Left".action = focus-column-left;
          "Mod+Right".action = focus-column-right;
          "Mod+Down".action = focus-workspace-down;
          "Mod+Up".action = focus-workspace-up;

          "Mod+1".action.focus-workspace = 1;
          "Mod+2".action.focus-workspace = 2;
          "Mod+3".action.focus-workspace = 3;
          "Mod+4".action.focus-workspace = 4;
          "Mod+5".action.focus-workspace = 5;

          "Mod+Shift+H".action = move-column-left;
          "Mod+Shift+L".action = move-column-right;
          "Mod+Shift+K".action = move-column-to-workspace-up;
          "Mod+Shift+J".action = move-column-to-workspace-down;
        };
      };
    };
  };
}
