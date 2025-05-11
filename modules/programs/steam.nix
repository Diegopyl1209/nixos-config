{
  pkgs,
  lib,
  config,
  ...
}: {
  options.nixos.programs.steam.enable = lib.mkEnableOption "Enable Steam";

  config = lib.mkIf config.nixos.programs.steam.enable {
    hardware.xpadneo.enable = true;
    programs.steam = {
      enable = true;
      # platformOptimizations.enable = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };
  };
}
