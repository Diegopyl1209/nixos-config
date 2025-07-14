{
  config,
  lib,
  ...
}: {
  options.home-manager.programs.waybar.enable = lib.mkEnableOption "Enable Waybar Config";

  config = lib.mkIf config.home-manager.programs.waybar.enable {
    programs.waybar = {
      enable = true;
      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          height = 30;
          modules-left = ["niri/workspaces" "niri/window"];
          modules-center = ["clock"];
          modules-right = ["pulseaudio" "bluetooth" "network" ];

          "bluetooth" = {
            format-on = "";
            format-off = "󰂲";
            format-connected = " {device_battery_percentage}%";
          };
          "niri/window" = {
            format = "{app_id}";
            icon = true;
            icon-size = 16;
          };
          "clock" = {
            format = "{:%d.%m.%Y | %H:%M}";
            format-alt = "{:%A, %B %d at %R}";
            tooltip = false;
          };
          "pulseaudio" = {
            format = "{icon} {volume}%";
            format-bluetooth = "{icon} {volume}%";
            format-muted = "󰝟";
            format-icons = {
              "headphone" = "󰋋";
              "headphone-muted" = "󰟎";
              "handsfree" = "󰟎";
              "handsfree-muted" = "󰋐";
              "headset" = "󰋎";
              "headset-muted" = "󰋐";
              "phone" = "";
              "portable" = "";
              "car" = "";
              "default" = ["" " "];
            };
            on-click = "pwvucontrol";
          };
        };
      };

      style = with config.lib.stylix.colors; ''
        * {
          border: none;
          border-radius: 0;
          font-family: "DejaVu Sans";
          font-weight: bold;
          font-size: 14px;
          min-height: 0;
          color: #ddc7a1;
        }

        window#waybar {
          background: #${base00};
        }

        #workspaces {
          margin: 0.5rem;
          background: #${base02};
          border-radius: 6px;
        }

        #workspaces button:hover {
          border-radius: 6px;
          color: #${base03};
          background: #${base05};
        }

        #workspaces button label {
          color: #${base06};
        }

        #workspaces button:hover label {
          color: #${base03};
        }

        #workspaces button.active {
          background: #${base05};
          border-radius: 6px;
        }
        #workspaces button.active label {
          color: #${base03};
        }

        #bluetooth, #pulseaudio {
          padding: 0 8px;
        }

        #power, #battery, #tray, #network,
        #custom-power, #custom-microphone {
          padding: 0 8px;
          margin: 6 10px;
          background: #${base02};
          border-radius: 6px;
        }
      '';
    };
  };
}
