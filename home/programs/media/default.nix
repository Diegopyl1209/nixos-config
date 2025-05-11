{
  pkgs,
  lib,
  config,
  ...
}: {
  options.home-manager.programs.media.enable = lib.mkEnableOption "Enable media related software";

  imports = [
    ./spotify.nix
    ./mpv.nix
  ];

  config = lib.mkIf config.home-manager.programs.media.enable {
    home.packages = with pkgs; [
      # audio control
      pulsemixer
      pwvucontrol
      helvum

      # audio
      amberol
      spotify

      # images
      loupe

      # videos
      celluloid

      # torrents
      transmission_4-gtk
    ];
  };
}
