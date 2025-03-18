{...}: {
  imports = [
    ./sops.nix
    ./steam.nix
    ./gnome.nix
    ./hyprland.nix
    ./display-manager.nix
    ./nix.nix
    ./base.nix
    ./fish.nix
    ./server
    ./hardware
  ];
}
