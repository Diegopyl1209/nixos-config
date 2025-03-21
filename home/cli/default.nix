{pkgs, ...}: {
  imports = [
    ./fish

    ./bash.nix
    ./bat.nix
    ./direnv.nix
    ./gh.nix
    ./fzf.nix
    ./helix.nix
    ./neovim
  ];
  home.packages = with pkgs; [
    zip
    xz
    unzip
    unrar

    comma # Install and run programs by sticking a , before them
    distrobox # Nice escape hatch, integrates docker images with my environment

    bc # Calculator
    bottom # System viewer
    ncdu # TUI disk usage
    eza # Better ls
    ripgrep # Better grep
    fd # Better find
    httpie # Better curl
    jq # JSON pretty printer and manipulator
    timer

    nixd # Nix LSP
    alejandra # Nix formatter
    nixfmt-rfc-style
    nvd # Differ
    nix-diff # Differ, more detailed
    nix-output-monitor
    nh # Nice wrapper for NixOS and HM
    clang-tools
    git
  ];
}
