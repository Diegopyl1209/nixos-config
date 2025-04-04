{ ... }:
{
  programs.neovim = {
    coc.enable = true;

    coc.settings = {
      "suggest.noselect" = true;
      "suggest.enablePreview" = true;
      "suggest.enablePreselect" = false;
      "suggest.disableKind" = true;
      languageserver = {
        c = {
          command = "clangd";
          rootPatterns = ["compile_flags.txt" "compile_commands.json"];
          filetypes = ["c" "cc" "cpp" "c++" "objc" "objcpp"];
        };
        
        nix = {
          command = "nixd";
          rootPatterns = [".nixd.json"];
          filetypes = ["nix"];
        };

      };
    };

  };

}
