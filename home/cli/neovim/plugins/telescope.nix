{pkgs, ...}: {
  programs.neovim = {
    plugins = [
      pkgs.vimPlugins.telescope-nvim
    ];

    extraLuaConfig =
      # lua
      ''
        require("telescope").setup({
          defaults = {
             borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
             file_ignore_patterns = { "^.git/" },
          }
        })

      '';
  };
}
