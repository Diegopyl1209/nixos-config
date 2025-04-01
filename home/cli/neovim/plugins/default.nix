{pkgs, ...}: {
  imports = [
    ./lualine.nix
    ./base16.nix
    ./telescope.nix
    ./cmp.nix
    ./lsp.nix
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
