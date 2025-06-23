{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.hm.home-manager.programs.niri.enable {
    programs.niri = {
      enable = true;
    };
  };
}
