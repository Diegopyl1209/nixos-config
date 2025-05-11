{pkgs, inputs, lib, config, username, ...}: {
  options.nixos.programs.agenix.enable = lib.mkEnableOption "Enable Agenix";
  
  imports = [
    inputs.agenix.nixosModules.default
  ];
  
  config = lib.mkIf config.nixos.programs.agenix.enable {
    environment.systemPackages = [
      inputs.agenix.packages.${pkgs.system}.default 
    ];

    age = {
      identityPaths = [ "/home/${username}/.ssh/id_ed25519" ];
    };
    
  };
}
