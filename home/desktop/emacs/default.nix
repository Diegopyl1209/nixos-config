{pkgs, ...}: {
  services.emacs = {
    enable = true;
    client.enable = true;
    startWithUserSession = "graphical";
  };

  programs.emacs = {
    enable = true;
    package = (
      pkgs.emacsWithPackagesFromUsePackage {
        package = pkgs.emacs; #pkgs.emacs-git-pgtk;
        config = ./config.org;
        defaultInitFile = true;
        extraEmacsPackages = epkgs: [
          pkgs.ghostscript
          pkgs.texliveMedium
          epkgs.use-package
          epkgs.all-the-icons
          epkgs.base16-theme
          epkgs.doom-themes
          epkgs.doom-modeline
          epkgs.org-superstar
          epkgs.diminish
          epkgs.general
          epkgs.vertico
          epkgs.orderless
          epkgs.marginalia
          epkgs.ace-window
          epkgs.undo-tree
          epkgs.flycheck
          epkgs.company
          epkgs.projectile
          epkgs.magit
          epkgs.sudo-edit
          epkgs.pdf-tools
          epkgs.meow
          epkgs.vterm
          epkgs.yasnippet

          # LaTeX
          epkgs.auctex
          epkgs.cdlatex
          epkgs.xenops

          # Languages
          epkgs.treesit-grammars.with-all-grammars
          epkgs.lsp-mode
          epkgs.nix-ts-mode
          epkgs.rustic
        ];
      }
    );
  };
}
