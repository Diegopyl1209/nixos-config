{ pkgs, ... }:
{
  programs.neovim = {
    plugins = [
      pkgs.vimPlugins.markdown-preview-nvim
    ];

    extraLuaConfig = # lua
      ''
        --require("markdown-preview").setup({})
      '';
  };
}
