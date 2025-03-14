{...}:{
  programs.git = {
    enable = true;
    userEmail = "diegopyl1209@gmail.com";
    userName = "Diego Peña y Lillo";
    ignores = [
      # emacs stuff
      ".\#*"
      "*~"
      "\#*\#"
      "*.elc"
      "auto-save-list"
      "tramp"
      ".org-id-locations"
      "*_archive"
      "*_flymake.*"
      "/eshell/history"
      "/eshell/lastdir"
    ];
  };
}
