{sources ? import ./sources.nix}: let
  inherit
    (sources)
    home-manager
    nixpkgs
    nur
    typhon
    ;

  utils = import ./utils.nix {inherit sources;};

  availableModules = let
    registry = utils.registryFrom {nixpkgs = "nixpkgs";};
    nixPath = utils.nixPathFromRegistry {inherit (registry) nixpkgs;};
  in {
    registry = {nix = {inherit registry;};};
    nixPath = {nix = {inherit nixPath;};};
    inputs = utils.mkVarModule "inputs" sources;
    typhon = typhon.nixosModules.default;
  };
in {
  homeManagerConfigurations = let
    system = "x86_64-linux";
  in {
    pnm.${system} = home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs {
        inherit system;
        overlays = [nur.overlay];
      };
      modules =
        [../users/pnm/home.nix]
        ++ nixpkgs.lib.attrValues {inherit (availableModules) registry;};
    };
  };

  nixosConfigurations = import ../hosts {
    inherit (nixpkgs) lib;
    inherit availableModules;
  };
}
