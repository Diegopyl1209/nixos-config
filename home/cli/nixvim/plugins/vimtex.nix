{
  programs.nixvim = {
    extraConfigVim =
      # vimscript
      ''
        set conceallevel=1

      '';
    plugins.vimtex = {
      enable = true;
      settings = {
        quickfix_mode = 0;
        view_method = "zathura";
      };
    };
  };
}
