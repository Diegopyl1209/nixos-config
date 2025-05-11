{
  config,
  lib,
  ...
}: {
  options.nixos.programs.xdg.enable = lib.mkEnableOption "Enable XDG related config";

  config = lib.mkIf config.nixos.programs.xdg.enable {
    xdg.terminal-exec = {
      enable = true;
      settings = {
        default = ["alacritty.desktop"];
      };
    };
  };
}
