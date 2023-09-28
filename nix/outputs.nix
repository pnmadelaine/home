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

  systems = import ./systems.nix;
in {
  homeManagerConfigurations = nixpkgs.lib.genAttrs systems (system: {
    pnm = home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs {
        inherit system;
        overlays = [nur.overlay];
      };
      modules =
        [../users/pnm/home.nix]
        ++ nixpkgs.lib.attrValues {inherit (availableModules) registry;};
    };
  });

  nixosConfigurations = import ../hosts {
    inherit (nixpkgs) lib;
    inherit availableModules;
  };
}
