{
  lib,
  config,
  ...
}: {
  options.nixos.services.gdm.enable = lib.mkEnableOption "Enable GDM";

  config = lib.mkIf config.nixos.services.gdm.enable {
    # https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
    systemd.services."getty@tty1".enable = false;
    systemd.services."autovt@tty1".enable = false;
  
    services.displayManager.gdm.enable = true;
  };
}
