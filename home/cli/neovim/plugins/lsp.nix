{pkgs, ...}: {
  programs.neovim = {
    plugins = [
      pkgs.vimPlugins.nvim-lspconfig
      pkgs.vimPlugins.lsp-format-nvim
    ];
    extraLuaConfig =
      # lua
      ''
        require("lsp-format").setup({})
        local lspconfig = require('lspconfig')

        local on_attach = function(client, bufnr)
          require("lsp-format").on_attach(client, bufnr)
        end

        lspconfig.nixd.setup({
            on_attach = on_attach,
            formatting = { command = {"alejandra"} },
          })
        lspconfig.lua_ls.setup({})
        lspconfig.clangd.setup({})
      '';
  };
}
