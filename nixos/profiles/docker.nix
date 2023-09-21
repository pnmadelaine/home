{...}: {
  virtualisation.docker.enable = true;
  users.users.pnm.extraGroups = ["docker"];
}
