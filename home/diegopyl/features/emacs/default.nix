{ pkgs, ... }:
{
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
          epkgs.diminish
          epkgs.vterm
          epkgs.evil
          epkgs.evil-collection
          epkgs.evil-tutor
          epkgs.general
          epkgs.ivy
          epkgs.ivy-rich
          epkgs.counsel
          epkgs.swiper
          epkgs.doom-modeline
          epkgs.doom-themes
          epkgs.ace-window
          epkgs.undo-tree
          epkgs.rainbow-delimiters
          epkgs.flycheck
          epkgs.company
          epkgs.projectile
          epkgs.magit

          # Languages
          epkgs.lsp-mode
          epkgs.nix-mode
          epkgs.kotlin-mode
          pkgs.kotlin-language-server
        ];
      }
    );
  };
}
