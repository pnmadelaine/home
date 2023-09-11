{

  inputs = { nixpkgs.url = "nixpkgs/nixos-unstable"; };

  outputs = inputs@{ self, nixpkgs }:
    let
      lib = import ./lib { inherit (nixpkgs) lib; };
      system = "x86_64-linux";
      registry = lib.registryFrom { nixpkgs = "nixpkgs"; };
      nixPath = lib.nixPathFromRegistry { inherit (registry) nixpkgs; };
      availableModules = {
        registry = lib.mkVarModule "registry" registry;
        nixPath = lib.mkVarModule "nixPath" nixPath;
      };
    in {
      nixosConfigurations =
        import ./hosts { inherit system lib availableModules; };
    };

}
