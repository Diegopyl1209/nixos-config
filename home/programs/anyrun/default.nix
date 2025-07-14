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
        * {
          all: unset;
          font-size: 1.2rem;
        }

        #window,
        #match,
        #entry,
        #plugin,
        #main {
          background: transparent;
        }

        #match.activatable {
          border-radius: 8px;
          margin: 4px 0;
          padding: 4px;
        }

        #match.activatable:first-child {
          margin-top: 12px;
        }

        #match.activatable:last-child {
          margin-bottom: 0;
        }

        #match:hover {
          background: rgba(40, 40, 40, 0.9);
        }

        #match:selected {
          background: rgba(60, 60, 60, 0.95);
        }

        #entry {
          background: #${base00};
          border: 1px solid rgba(255, 255, 255, 0.2);
          border-radius: 8px;
          padding: 4px 8px;
        }

        box#main {
          background: #${base01};
          box-shadow:
            inset 0 0 0 1px rgba(255, 255, 255, 0.15),
            0 30px 30px 15px rgba(0, 0, 0, 0.3);
          border-radius: 16px;
          padding: 12px;
        }

      '';
    };
  };
}
