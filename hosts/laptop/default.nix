{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t490
    inputs.nixos-hardware.nixosModules.common-pc-ssd
  ];

  programs.java.enable = true;

  server.enable = false;

  nixos = {
    amdgpu.enable = false;
    nvidia = {
      version = "beta";
      enable = false;
    };
  };

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      vpl-gpu-rt
    ];
  };
}
