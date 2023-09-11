{ config, pkgs, ... }:

let
  mkSymlink = config.lib.file.mkOutOfStoreSymlink;
  createLinks = root: dirs:
    pkgs.lib.genAttrs dirs (x: { source = mkSymlink "${root}/${x}"; });
in {
  home.file =
    (createLinks "/data/pnm" [ ".ssh" "Documents" "Downloads" "Music" ]) // {
      ".config/nix/registry.json".text = builtins.toJSON {
        version = 2;
        flakes = config.registry;
      };
    };
}
