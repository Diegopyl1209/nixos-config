{
  pkgs,
  lib,
  config,
  ...
}: {
  options.home-manager.programs.media.mpv.enable = lib.mkEnableOption "Enable MPV";

  config = lib.mkIf config.home-manager.programs.media.mpv.enable {
    programs.mpv = {
      enable = true;
      defaultProfiles = ["gpu-hq"];
      scripts = [pkgs.mpvScripts.mpris];
    };
  };
}
