{ config, pkgs, ... }:
let
  mkSymlink = config.lib.file.mkOutOfStoreSymlink;
  createLinks =
    root: dirs:
    pkgs.lib.genAttrs dirs (x: {
      source = mkSymlink "${root}/${x}";
    });
in
{
  home.file = createLinks "/data/pnm" [
    ".local/state/syncthing"
    ".ssh/id_ed25519"
    ".ssh/id_ed25519.pub"
    "Documents"
    "Downloads"
    "Music"
  ];
}
