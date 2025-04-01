{pkgs, ...}: {
  programs.neovim = {
    plugins = [
      pkgs.vimPlugins.indent-blankline-nvim-lua
    ];

    extraLuaConfig =
      #lua
      ''
        require("ibl").setup({
            indent = {
              char = "▏",
            },
            scope = { enabled = false }
          })
      '';
  };
}
