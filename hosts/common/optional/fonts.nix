{ pkgs, ... }:
{
  fonts.packages = [
    pkgs.emacs-all-the-icons-fonts
    pkgs.nerd-fonts.fira-code
  ];
}
