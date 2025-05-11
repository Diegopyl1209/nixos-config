{username, ...}: {
  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "24.11";
  };

  imports = [
    ./cli
    ./colorschemes
    ./programs
    ./services
  ];

  programs.home-manager.enable = true;
}
