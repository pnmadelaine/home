{
  lib,
  availableModules,
}: let
  mkConfig = hostname:
    lib.nixosSystem {
      system = import ./${hostname}/system.nix;
      modules =
        (builtins.attrValues availableModules)
        ++ [./${hostname}/configuration.nix];
    };
  hosts =
    lib.attrsets.filterAttrs (_: type: type == "directory")
    (builtins.readDir ./.);
in
  lib.mapAttrs (hostname: _: mkConfig hostname) hosts
