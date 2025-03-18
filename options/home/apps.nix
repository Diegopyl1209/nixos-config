{
  lib,
  host,
  ...
}: {
  options.home-manager = {
    graphical.enable =
      lib.mkEnableOption "Graphical"
      // {
        default = host != "server";
      };
    steam.enable =
      lib.mkEnableOption "Steam"
      // {
        default = host != "server";
      };
    obs.enable =
      lib.mkEnableOption "Obs"
      // {
        default = host != "server";
      };
    emacs.enable =
      lib.mkEnableOption "Emacs"
      // {
        default = true;
      };
    helix.enable =
      lib.mkEnableOption "Helix"
      // {
        default = true;
      };
  };
}
