{ pkgs, ... }:
{
  programs.neovim = {
    plugins = [
      pkgs.vimPlugins.nvim-lspconfig
    ];
    extraLuaConfig = # lua
      ''
        local lspconfig = require('lspconfig')
        lspconfig.nixd.setup({})
        lspconfig.lua_ls.setup({})
        lspconfig.clangd.setup({})
      '';
  };
}
