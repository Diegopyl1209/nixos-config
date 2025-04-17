{
  pkgs,
  inputs,
  ...
}:
{
  home.packages = with pkgs; [
    # Gui Apps
    inputs.zen-browser.packages."${pkgs.system}".default
    github-desktop
    zoom-us
    mpv

    # Cli Apps
    ghostscript
    wl-clipboard

    # Development
    jetbrains.idea-ultimate
    android-studio
    gcc
    rust-analyzer
    rustc
    cargo
    clippy
    rustfmt

    # Gaming
    prismlauncher
    (tetrio-desktop.overrideAttrs (old: {
      withTetrioPlus = true;
    }))
    mangohud

    texliveMedium
  ];
}
