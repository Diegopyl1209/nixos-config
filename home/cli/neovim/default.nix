{ ... }:
{
  imports = [
    ./completion.nix
    ./plugins/lualine.nix
    ./plugins/tree-sitter.nix
    ./plugins/lsp.nix
    ./plugins/trouble.nix
    ./plugins/web-devicons.nix
    ./plugins/which-key.nix
    ./plugins/telescope.nix
  ];
  programs.nixvim = {
    enable = true;
    colorschemes.base16 = {
      enable = true;
      colorscheme = "gruvbox-material-dark-hard";
      settings = {
        cmp = true;
      };
    };

    clipboard = {
      # Use system clipboard
      register = "unnamedplus";

      providers.wl-copy.enable = true;
    };

    opts = {
      relativenumber = true;
      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      autoindent = true;
    };
  };
}
