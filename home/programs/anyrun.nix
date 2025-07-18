{
  config,
  inputs,
  pkgs,
  lib,
  ...
}: {
  options.home-manager.programs.anyrun.enable = lib.mkEnableOption "Enable Anyrun";

  config = lib.mkIf config.home-manager.programs.anyrun.enable {
    programs.anyrun = {
      enable = true;
      config = {
        showResultsImmediately = true;
        plugins = [
          inputs.anyrun.packages.${pkgs.system}.applications
          inputs.anyrun.packages.${pkgs.system}.shell
        ];
      };
      extraCss = with config.lib.stylix.colors; ''
        #window {
          background-color: rgba(0, 0, 0, 0);
        }

        box#main {
          border-radius: 10px;
          background-color: @theme_bg_color;
        }

        list#main {
          background-color: rgba(0, 0, 0, 0);
          border-radius: 10px;
        }

        list#plugin {
          background-color: rgba(0, 0, 0, 0);
        }

        label#match-desc {
          font-size: 10px;
        }

        label#plugin {
          font-size: 14px;
        }
      '';
    };
  };
}
