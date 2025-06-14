{
  inputs,
  pkgs,
  lib,
  config,
  ...
}: {
  options.home-manager.programs.editors.emacs.enable = lib.mkEnableOption "Enable Emacs";

  config = lib.mkIf config.home-manager.programs.editors.emacs.enable {
    services.emacs = {
      enable = true;
      client.enable = true;
      startWithUserSession = "graphical";
    };

    programs.emacs = {
      enable = true;
      package = pkgs.emacs-git-pgtk.pkgs.withPackages (epkgs:
        with epkgs; [
          treesit-grammars.with-all-grammars
          vterm
        ]);
    };

    home.packages = with pkgs; [
      fd
      pandoc
      (ripgrep.override {withPCRE2 = true;})
      emacs-all-the-icons-fonts
      fontconfig
    ];

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
  };
}
