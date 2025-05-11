{
  pkgs,
  lib,
  config,
  ...
}: {
  options.nixos.programs.wine.enable = lib.mkEnableOption "Enable wine";

  config = lib.mkIf config.nixos.programs.wine.enable {
    environment.defaultPackages = with pkgs; [
      wineWowPackages.waylandFull
      dxvk
      vkd3d
    ];

    environment.sessionVariables = {
      WINEDLLOVERRIDES = "winemenubuilder.exe=d";
      WINEWAYLAND_DISABLE_XWAYLAND = "1";
      WINE_VK_VULKAN_ONLY = "1";
    };
  };
}
