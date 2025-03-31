{host, ...}: {
  programs.nixvim = {
    plugins = {
      lsp-format.enable = true;
      lsp = {
        enable = true;

        keymaps = {
          silent = true;
          diagnostic = {
            # Navigate in diagnostics
            "<leader>k" = "goto_prev";
            "<leader>j" = "goto_next";
          };

          lspBuf = {
            gd = "definition";
            gD = "references";
            gt = "type_definition";
            gi = "implementation";
            K = "hover";
            "<F2>" = "rename";
          };
        };

        servers = {
          lua_ls.enable = true;
          nixd = {
            enable = true;
            settings = {
              formatting = {
                command = ["alejandra"];
              };
              options = {
                nixos = {
                  expr = "(builtins.getFlake (\"git+file://\" + toString ./.)).nixosConfigurations.${host}.options";
                };
                home_manager = {
                  expr = "(builtins.getFlake (\"git+file://\" + toString ./.)).homeConfigurations.${host}.options";
                };
              };
            };
          };
          clangd.enable = true;
        };
      };
    };
  };
}
