{
  lib,
  config,
  ...
}: {
  options.nixos.programs.noisetorch.enable = lib.mkEnableOption "Enable NoiseTorch";

  config = lib.mkIf config.nixos.programs.noisetorch.enable {
    programs.noisetorch.enable = true;
  };
}
