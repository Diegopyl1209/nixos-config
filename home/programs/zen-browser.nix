{
  inputs,
  pkgs,
  lib,
  config,
  ...
}: {
  options.home-manager.programs.zen-browser.enable = lib.mkEnableOption "Enable Zen Browser";

  config = lib.mkIf config.home-manager.programs.zen-browser.enable {
    home.packages = [
      inputs.zen-browser.packages.${pkgs.system}.default
    ];
  };
}
