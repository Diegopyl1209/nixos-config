{...}: {
  programs.emacs = {
    enable = true;
    extraConfig = ''
      (setq standard-indent 2)
    '';
  };
}
