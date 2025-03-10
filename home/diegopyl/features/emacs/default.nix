{ pkgs, lib, ... }:
{
  services.emacs = {
    enable = true;
    client.enable = true;
  };

  programs.emacs = {
    enable = true;
    package = (
      pkgs.emacsWithPackagesFromUsePackage {
        package = pkgs.emacs;
        config = ./config.org;
        defaultInitFile = true;
        extraEmacsPackages = epkgs: [
          epkgs.use-package
          epkgs.vterm
          epkgs.evil
        ];
      }
    );
  };
}
