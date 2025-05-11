let
  diegopyl = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINLda0JTSWAE/syD1VRZzO1/jAzJVAwrUvHk5stfXB34 diegopyl@pc";
in {
  "cloudflare_token.age".publicKeys = [diegopyl];
}
