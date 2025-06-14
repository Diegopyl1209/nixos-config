{
  config,
  lib,
  pkgs,
  ...
}: {
  options.home-manager.programs.github-desktop.enable = lib.mkEnableOption "Enable Github Desktop";

  config = lib.mkIf config.home-manager.programs.github-desktop.enable {
    home.packages = [
      pkgs.github-desktop
    ];
  };
}
