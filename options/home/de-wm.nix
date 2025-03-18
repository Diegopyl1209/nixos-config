{
  config,
  lib,
  host,
  ...
}: {
  options.home-manager = {
    gnome.enable =
      lib.mkEnableOption "Gnome"
      // {
        default = host == "pc";
      };
    hyprland = {
      enable =
        lib.mkEnableOption "Hyprland"
        // {
          default = host == "laptop";
        };
      nvidia =
        lib.mkEnableOption "Hyprland nvidia compatibility"
        // {
          default = false;
        };
    };

    gdm.enable =
      lib.mkEnableOption "GDM"
      // {
        default = host == "pc";
      };
    tuigreet.enable =
      lib.mkEnableOption "Tuigreet"
      // {
        default = host == "laptop";
      };
  };

  config = {
    assertions = [
      {
        assertion = !(config.home-manager.gdm.enable && config.home-manager.tuigreet.enable);
        message = "Error: gdm.enable and tuigreet.enable cannot be true at the same time.";
      }
    ];
  };
}
