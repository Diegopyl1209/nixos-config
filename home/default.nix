{username, ...}: {
  home = {
    username = username;
    homeDirectory = "/home/${username}";
    stateVersion = "23.05";
  };

  imports = [
    ./desktop
    ./cli
    ./software
    ./colorschemes
  ];

  programs.home-manager.enable = true;
}
