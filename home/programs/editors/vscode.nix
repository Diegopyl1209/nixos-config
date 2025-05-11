{
  pkgs,
  lib,
  config,
  ...
}: {
  options.home-manager.programs.editors.vscode.enable = lib.mkEnableOption "Enable VScode";

  config = lib.mkIf config.home-manager.programs.editors.vscode.enable {
    programs.vscode = {
      enable = true;
      package = pkgs.vscode.fhsWithPackages (
        ps:
          with ps; [
            pkg-config
          ]
      );
    };
  };
}
