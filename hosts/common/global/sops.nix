{inputs, ...}: {
  imports = [inputs.sops-nix.nixosModules.sops];

  sops = {
    defaultSopsFile = ../secrets.yaml;
    age.sshKeyPaths = [ "/home/diegopyl/.ssh/id_ed25519" ];
    #age.keyFile = "/home/diegopyl/.config/sops/age/keys.txt";
    #age.generateKey = true;
  };
}
