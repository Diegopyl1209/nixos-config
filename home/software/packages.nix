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
    bear
    cmake
    gnumake
    rust-analyzer
    rustc
    cargo
    clippy
    rustfmt
    man-pages
    mbedtls

    # Gaming
    prismlauncher
    (tetrio-desktop.overrideAttrs (old: {
      withTetrioPlus = true;
    }))
    mangohud
    heroic

    texliveMedium
  ];
}
