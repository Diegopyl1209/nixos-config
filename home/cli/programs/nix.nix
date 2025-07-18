{pkgs, ...}:
# nix tooling
{
  home.packages = with pkgs; [
    alejandra
    deadnix
    statix
    #nixd
    #self.packages.${pkgs.system}.repl
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
