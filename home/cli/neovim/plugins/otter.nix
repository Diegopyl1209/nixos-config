{pkgs, ...}: {
  programs.neovim = {
    plugins = [
      pkgs.vimPlugins.otter-nvim
    ];

    extraLuaConfig =
      #lua
      ''
        require("otter")
      '';
  };
}
