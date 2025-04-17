{ pkgs, ... }:
{
  services.emacs = {
    enable = true;
    client.enable = true;
    startWithUserSession = "graphical";
  };

  programs.emacs = {
    enable = true;
    package = (
      pkgs.emacsWithPackagesFromUsePackage {
        package = pkgs.emacs; # pkgs.emacs-git-pgtk;
        config = ./config.org;
        defaultInitFile = true;
        extraEmacsPackages = epkgs: [
          epkgs.use-package
          epkgs.dashboard
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
	  epkgs.general

          #lang
          epkgs.treesit-grammars.with-all-grammars
          epkgs.lsp-mode
          epkgs.nix-ts-mode
          epkgs.rustic
        ];
      }
    );
  };

  xdg.configFile."emacs/ue-colorful.png".source = ./ue-colorful.png;
}
