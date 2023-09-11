{ lib }:

let

  getLockedInfo = lock: input:
    let x = lock.nodes.root.inputs.${input};
    in if lib.lists.isList x then
      getLockedInfo lock (lib.lists.last x)
    else
      lock.nodes.${x}.locked;

  lock = builtins.fromJSON (builtins.readFile ../flake.lock);

  registryFrom = regs:
    builtins.mapAttrs (name: value: {
      from = {
        type = "indirect";
        id = name;
      };
      to = {
        inherit (value) type;
      } // (if value ? url then {
        inherit (value) url;
      } else {
        inherit (value) owner repo rev;
      });
      exact = true;
    }) (lib.mapAttrs (_: getLockedInfo lock) regs);

  urlFromLockedInfo = info:
    if info ? url then
      info.url
    else if info.type == "github" then
      "https://github.com/${info.owner}/${info.repo}/archive/${info.rev}.tar.gz"
    else if info.type == "gitlab" then
      "https://gitlab.com/${info.owner}/${info.repo}/-/archive/${info.rev}.tar.gz"
    else
      throw "urlFromLockedInfo: node type not recognized";

  nixPathFromRegistry = lib.attrsets.mapAttrsToList
    (name: value: "${name}=${urlFromLockedInfo value.to}");

  # Make a NixOS module to expose a variable
  mkVarModule = name: value: {
    options.${name} =
      lib.mkOption { type = lib.types.uniq lib.types.anything; };
    config = { ${name} = value; };
  };

in lib // {
  inherit lock getLockedInfo registryFrom mkVarModule nixPathFromRegistry;
}
