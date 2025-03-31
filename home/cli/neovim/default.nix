{ ... }:
{
  imports = [
    ./plugins/lualine.nix
    ./plugins/base16.nix
    ./plugins/telescope.nix
    ./plugins/cmp.nix
    ./plugins/lsp.nix
    ./plugins/treesit.nix
  ];

  programs.neovim = {
    enable = true;

    extraLuaConfig = # lua
      ''
        vim.g.mapleader = ' '
      '';
  };

}
