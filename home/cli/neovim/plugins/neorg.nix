{
  programs.nixvim = {
    plugins.neorg = {
      enable = true;

      settings = {
        load = {
          "core.concealer" = {
            config = {
              icon_preset = "varied";
            };
          };
          "core.defaults" = {
            __empty = null;
          };
          "core.dirman" = {
            config = {
              workspaces = {
                home = "~/notes/home";
                school = "~/notes/school";
              };
              default_workspace = "school";
            };
          };
          "core.export" = {
            export_dir = "<export-dir>/<language>-export";
          };
          "core.integrations.image" = {
            __empty = null;
          };
          "core.latex.renderer" = {
            __empty = null;
          };
          "core.highlights" = {
            __empty = null;
          };
        };
      };

    };
  };
}
