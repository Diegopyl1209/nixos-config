{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./discord.nix
    ./pavucontrol.nix
    ./playerctl.nix
    ./zen-browser.nix
    ./runelite.nix
    ./mimeapps.nix
  ];

  home.packages = [
    pkgs.android-studio
    pkgs.jetbrains.idea-ultimate
    pkgs.github-desktop
    pkgs.libnotify
    pkgs.handlr-regex
    (pkgs.writeShellScriptBin "xterm" ''
      handlr launch x-scheme-handler/terminal -- "$@"
    '')
    (pkgs.writeShellScriptBin "xdg-open" ''
      handlr open "$@"
    '')
  ];

  # Also sets org.freedesktop.appearance color-scheme
  dconf.settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";

  xdg.portal = {
    enable = true;
    config.common.default = "*";
  };
}
