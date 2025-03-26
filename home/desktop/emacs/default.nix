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
          epkgs.use-package
          epkgs.doom-themes
          epkgs.doom-modeline
          epkgs.org-modern
          epkgs.diminish
          epkgs.evil
          epkgs.evil-collection
          epkgs.general
          epkgs.ivy
          epkgs.counsel
          epkgs.swiper
          epkgs.ace-window
          epkgs.undo-tree
          epkgs.flycheck
          epkgs.company
          epkgs.projectile
          epkgs.magit
          epkgs.sudo-edit

          # Languages
          epkgs.treesit-grammars.with-all-grammars
          epkgs.lsp-mode
          epkgs.nix-ts-mode
        ];
      }
    );
  };
}
