{
  inputs,
  pkgs,
  config,
  ...
}: {
  services.emacs = {
    enable = true;
    client.enable = true;
    startWithUserSession = "graphical";
  };

  programs.emacs = {
    enable = true;
    package = pkgs.emacs;
  };

  home = {
    sessionVariables = {
      DOOMDIR = "${config.xdg.configHome}/doom";
      EMACSDIR = "${config.home.homeDirectory}/.emacs.d";
      DOOMLOCALDIR = "${config.xdg.dataHome}/doom";
      DOOMPROFILELOADFILE = "${config.xdg.stateHome}/doom-profiles-load.el";
    };

    # Note! This must correspond to $EMACSDIR
    sessionPath = ["${config.home.homeDirectory}/.emacs.d/bin"];
  };

  home.file."${config.home.homeDirectory}/.emacs.d".source = inputs.doom-emacs;

  xdg.configFile."doom" = {
    source = ./doom;
    recursive = true;
  };
}
