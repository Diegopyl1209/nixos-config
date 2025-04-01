{pkgs, ...}: {
  programs.neovim = {
    plugins = [
      pkgs.vimPlugins.nvim-cmp
      pkgs.vimPlugins.cmp-nvim-lsp
      pkgs.vimPlugins.cmp-buffer
      pkgs.vimPlugins.cmp-path
      pkgs.vimPlugins.lspkind-nvim
      #pkgs.vimPlugins.cmp-vimtex
      #pkgs.vimPlugins.cmp_luasnip
    ];

    extraLuaConfig =
      #lua
      ''
        local cmp = require("cmp")
        cmp.setup({
          formatting  = {
            format = require("lspkind").cmp_format({
              menu = {
                buffer = "[buffer]",
                luasnip = "[snip]",
                neorg = "[neorg]",
                nvim_lsp = "[LSP]",
                nvim_lua = "[api]",
                path = "[path]",
                vimtex = "[vimtex]",
              },

              before = function (entry, vim_item)
                vim_item.dup = 0
                return vim_item
              end
            })
          },
          mapping = {
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-d>"] = cmp.mapping.scroll_docs(-4),
            ["<C-e>"] = cmp.mapping.close(),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<CR>"] = cmp.mapping.confirm({ select = false }),
            ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
            ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
          },
          snippet = {
            expand = function(args)
              require("luasnip").lsp_expand(args.body)
            end,
          },
          sources = {
            { name = "path" },
            { name = "nvim_lsp" },
            --{ name = "luasnip" },
            { name = "buffer", option = { get_bufnrs = vim.api.nvim_list_bufs } },
            --{ name = "neorg" },
            --{ name = "vimtex" },
          },
          window = {
            completion = { border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" } },
            documentation = { border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" } },
          },
        })

      '';
  };
}
