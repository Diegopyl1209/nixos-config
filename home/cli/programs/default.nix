{pkgs, ...}: {
  imports = [
    ./yazi.nix
    ./nix.nix
  ];

  home.packages = with pkgs; [
    # archives
    zip
    unzip
    unrar

    # misc
    libnotify
    sshfs

    # utils
    du-dust
    duf
    fd
    file
    jaq
    ripgrep
    ripdrag
  ];

  programs = {
    eza.enable = true;
    bat.enable = true;
  };
}
