{ inputs, ... }:
let
  utils = inputs.nixCats.utils;
in
{
  nixCats = {
    enable = true;
    nixpkgs_version = inputs.nixpkgs;
    # this will add the overlays from ./overlays and also,
    # add any plugins in inputs named "plugins-pluginName" to pkgs.neovimPlugins
    # It will not apply to overall system, just nixCats.
    addOverlays = [
      (utils.standardPluginOverlay inputs)
    ];

    luaPath = "${./.}";

    packageNames = [ "nvim" ];

    categoryDefinitions.replace = (
      {
        pkgs,
        settings,
        categories,
        extra,
        name,
        mkNvimPlugin,
        ...
      }@packageDef:
      {
        lspsAndRuntimeDeps = {
          general = [ ];
        };
        startupPlugins = {
          general = with pkgs.vimPlugins; [
            lze
            telescope-nvim
            oil-nvim
            lualine-nvim
            base16-nvim
          ];

          optionalPlugins = {
            markdown = with pkgs.vimPlugins; [
              markdown-preview-nvim
            ];
            general = {
              cmp = with pkgs.vimPlugins; [
                nvim-cmp
                cmp-nvim-lsp
              ];
              treesiter = with pkgs.vimPlugins; [
                nvim-treesitter-textobjects
                nvim-treesitter.withAllGrammars
              ];
            };
          };
          # shared libraries to be added to LD_LIBRARY_PATH
          # variable available to nvim runtime
          sharedLibraries = {
            general = with pkgs; [
              # libgit2
            ];
          };
          extraPython3Packages = {
            test = (_: [ ]);
          };
          # populates $LUA_PATH and $LUA_CPATH
          extraLuaPackages = {
            test = [ (_: [ ]) ];
          };
        };
      }
    );

    packageDefinitions.replace= {
      # These are the names of your packages
      # you can include as many as you wish.
      nvim =
        { pkgs, ... }:
        {
          # they contain a settings set defined above
          # see :help nixCats.flake.outputs.settings
          settings = {
            wrapRc = true;
            aliases = [
              "vim"
              #"nvim"
              "vi"
            ];
            # neovim-unwrapped = inputs.neovim-nightly-overlay.packages.${pkgs.system}.neovim;
          };
          # and a set of categories that you want
          # (and other information to pass to lua)
          categories = {
            general = true;
            test = true;
            example = {
              youCan = "add more than just booleans";
              toThisSet = [
                "and the contents of this categories set"
                "will be accessible to your lua with"
                "nixCats('path.to.value')"
                "see :help nixCats"
              ];
            };
          };
        };
    };
  };
}
