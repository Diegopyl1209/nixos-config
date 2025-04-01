{pkgs, ...}: {
  imports = [
    ./plugins/default.nix
  ];

  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [
      alejandra # nix formatter
    ];
    extraConfig =
      # vim
      ''
         " indentation
        set tabstop=2
        set shiftwidth=2
        set expandtab
      '';
    extraLuaConfig =
      # lua
      ''
        vim.g.mapleader = ' '
      '';
  };
}
