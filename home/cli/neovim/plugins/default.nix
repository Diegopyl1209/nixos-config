{pkgs, ...}: {
  imports = [
    ./lualine.nix
    ./base16.nix
    ./telescope.nix
    ./cmp.nix
    ./lsp.nix
    #./coc.nix
    ./treesit.nix
    ./otter.nix
    ./ibl.nix
    ./markdown-preview.nix
  ];

  programs.neovim = {
    plugins = [
    ];
  };
}
