{
  username,
  userfullname,
  pkgs,
  ...
}: {
  users.users.${username} = {
    isNormalUser = true;
    description = userfullname;
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "adbusers"
      "kvm"
    ];
    shell = pkgs.fish;
  };

  programs.fish.enable = true;
}
