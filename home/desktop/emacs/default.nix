{pkgs, ...}: {
  services.emacs = {
    enable = true;
    client.enable = true;
  };

  programs.emacs = {
    enable = true;
    package = (
      pkgs.emacsWithPackagesFromUsePackage {
        package = pkgs.emacs-git-pgtk;
        config = ./config.org;
        defaultInitFile = true;
        extraEmacsPackages = epkgs: [
          pkgs.ghostscript
          pkgs.texliveMedium
          epkgs.use-package
          epkgs.all-the-icons
          epkgs.doom-themes
          epkgs.doom-modeline
          epkgs.org-superstar
          epkgs.diminish
          epkgs.evil
          epkgs.evil-collection
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

          # LaTeX
          epkgs.auctex
          epkgs.cdlatex
          epkgs.xenops

          # Languages
          epkgs.treesit-grammars.with-all-grammars
          epkgs.lsp-mode
          epkgs.nix-ts-mode
        ];
      }
    );
  };
}
