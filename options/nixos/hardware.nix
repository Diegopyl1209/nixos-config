{lib, ...}: {
  options.nixos = {
    amdgpu = {
      enable = lib.mkEnableOption "AMD gpu";
    };
    nvidia = {
      enable = lib.mkEnableOption "Nvidia drivers";
      version = lib.mkOption {
        type = lib.types.enum [
          "latest"
          "stable"
          "production"
          "beta"
        ];
        default = "latest";
      };
    };
  };
}
