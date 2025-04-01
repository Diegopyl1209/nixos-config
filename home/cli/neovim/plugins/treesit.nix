{pkgs, ...}: {
  programs.neovim = {
    plugins = [
      pkgs.vimPlugins.nvim-treesitter.withAllGrammars
    ];

    extraLuaConfig =
      # lua
      ''
        require("nvim-treesitter.configs").setup({
          highlight = { enable = true },
          indent = { enable = true }
        })
      '';
  };
}
