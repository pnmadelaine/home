{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur.url = "github:nix-community/nur";

    website.url = "github:pnmadelaine/website";

    typhon.url = "github:typhon-ci/typhon/dev-pnm";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    nur,
    website,
    typhon,
  }: let
    lib = import ./lib {inherit (nixpkgs) lib;};
    system = "x86_64-linux";
    availableModules = let
      registry = lib.registryFrom {nixpkgs = "nixpkgs";};
      nixPath = lib.nixPathFromRegistry {inherit (registry) nixpkgs;};
    in {
      registry = {nix = {inherit registry;};};
      nixPath = {nix = {inherit nixPath;};};
      inputs = lib.mkVarModule "inputs" inputs;
      typhon = typhon.nixosModules.default;
    };
    pkgs = import nixpkgs {
      inherit system;
      overlays = [nur.overlay];
    };
  in {
    homeManagerConfigurations = {
      pnm = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules =
          [./users/pnm/home.nix]
          ++ lib.attrValues {inherit (availableModules) registry;};
      };
    };
    nixosConfigurations =
      import ./hosts {inherit system lib availableModules;};
  };
}
