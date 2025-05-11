{
  username,
  config,
  ...
}: {
  environment.sessionVariables = {
    FLAKE = "/home/${username}/nixos-config";
  };
  programs.nh = {
    enable = true;
    flake = config.environment.sessionVariables.FLAKE;
  };
}
