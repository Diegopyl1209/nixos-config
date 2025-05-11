{lib, config, ...}: {
  options.nixos.services.tailscale.enable = lib.mkEnableOption "Enable Tailscale";
  
  config = lib.mkIf config.nixos.services.tailscale.enable {
    services.tailscale.enable = true;    
  };
}
