{
  programs.nixvim = {
    plugins.telescope = {
      enable = true;

      settings.defaults = {
        borderchars = ["─" "│" "─" "│" "┌" "┐" "┘" "└"];
        file_ignore_patterns = [
          "^.git/"
          "^.mypy_cache/"
          "^__pycache__/"
          "^output/"
          "^data/"
          "%.ipynb"
        ];
        set_env.COLORTERM = "truecolor";
      };
    };
  };
}
