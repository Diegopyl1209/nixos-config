{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    # Gui Apps
    inputs.zen-browser.packages."${pkgs.system}".default
    github-desktop
    zoom-us
    mpv

    # Development
    jetbrains.idea-ultimate
    android-studio

    # Gaming
    prismlauncher
    (tetrio-desktop.overrideAttrs (old: {
      withTetrioPlus = true;
    }))
    mangohud
  ];
}
