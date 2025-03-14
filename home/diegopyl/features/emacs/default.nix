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
          epkgs.use-package
          epkgs.diminish
          epkgs.vterm
          epkgs.evil
          epkgs.evil-collection
          epkgs.evil-tutor
          epkgs.general
          epkgs.ivy
          epkgs.counsel
          epkgs.swiper
          epkgs.doom-modeline
          epkgs.doom-themes
          epkgs.ace-window
          epkgs.undo-tree
        ];
      }
    );
  };
}
