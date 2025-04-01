{pkgs, ...}: {
  programs.neovim = {
    plugins = [
      pkgs.vimPlugins.base16-nvim
    ];

    extraLuaConfig =
      # lua
      ''
        require('base16-colorscheme').with_config({
          telescope_borders = true,
          cmp = true,
        })

        vim.cmd('colorscheme base16-gruvbox-material-dark-hard')
      '';
  };
}
