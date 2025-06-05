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
      package = pkgs.emacsWithPackagesFromUsePackage {
        package = pkgs.emacs-git-pgtk;
        config = ./config.org;
        defaultInitFile = true;
        extraEmacsPackages = epkgs: [
          epkgs.use-package
          epkgs.all-the-icons
          epkgs.doom-themes
          epkgs.doom-modeline
          epkgs.vterm
          epkgs.org-superstar
          epkgs.projectile
          epkgs.flycheck
          epkgs.vertico
          epkgs.orderless
          epkgs.marginalia
          epkgs.yasnippet
          epkgs.yasnippet-snippets
          epkgs.general
          epkgs.solaire-mode
          epkgs.diredfl
          epkgs.company
          epkgs.elcord

          epkgs.elfeed
          epkgs.elfeed-protocol
          epkgs.elfeed-goodies

          #lang
          epkgs.treesit-grammars.with-all-grammars
          epkgs.nix-ts-mode
        ];
      };
    };

    #xdg.configFile."emacs/ue-colorful.png".source = ./ue-colorful.png;
  };
}
