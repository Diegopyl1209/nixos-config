{
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
      package = (pkgs.emacsPackagesFor pkgs.emacs-git-pgtk).emacsWithPackages (epkgs:
        with epkgs; [
          vterm
          treesit-grammars.with-all-grammars

          # elfeed
          # elfeed-protocol
          # elfeed-goodies
        ]);
    };

    xdg.configFile."emacs" = {
      source = ./config;
      recursive = true;
    };
  };
}
