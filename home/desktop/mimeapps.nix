{config, ...}: {
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };

  xdg.mimeApps = {
    enable = config.home-manager.graphical.enable;
    defaultApplications = {
      "text/plain" = "nvim.desktop";
      "application/x-shellscript" = "nvim.desktop";
      "text/x-cmake" = "nvim.desktop";
      "text/markdown" = "nvim.desktop";
      "application/x-docbook+xml" = "nvim.desktop";
      "application/json" = "nvim.desktop";
      "application/x-yaml" = "nvim.desktop";
      "text/rhtml" = "nvim.desktop";
      "text/x-tex" = "nvim.desktop";
      "text/x-java" = "nvim.desktop";
      "inode/x-empty" = "nvim.desktop";
      "text/x-python" = "nvim.desktop";
      "text/x-readme" = "nvim.desktop";
      "text/x-markdown" = "nvim.desktop";

      "inode/directory" = "org.gnome.nautilus.desktop";

      "text/html" = "firefox.desktop";
      "x-scheme-handler/ftp" = "userapp-Zen-8ZLC22.desktop";
      "application/xhtml+xml" = "userapp-Zen-8ZLC22.desktop";
      "x-scheme-handler/http" = "userapp-Zen-8ZLC22.desktop";
      "x-scheme-handler/https" = "userapp-Zen-8ZLC22.desktop";
      "x-scheme-handler/chrome" = "userapp-Zen-8ZLC22.desktop";
      "application/x-extension-htm" = "userapp-Zen-8ZLC22.desktop";
      "application/x-extension-xht" = "userapp-Zen-8ZLC22.desktop";
      "application/x-extension-html" = "userapp-Zen-8ZLC22.desktop";
      "application/x-extension-shtml" = "userapp-Zen-8ZLC22.desktop";
      "application/x-extension-xhtml" = "userapp-Zen-8ZLC22.desktop";
      "x-scheme-handler/about" = "userapp-Zen-8ZLC22.desktop";
      "x-scheme-handler/unknown" = "userapp-Zen-8ZLC22.desktop";
    };
  };
  #xdg.configFile."mimeapps.list".force = true;
}
