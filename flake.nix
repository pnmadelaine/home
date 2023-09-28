{
  inputs = {
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };

    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur.url = "github:nix-community/nur";

    website.url = "github:pnmadelaine/website";

    typhon.url = "github:typhon-ci/typhon/dev-pnm";
  };

  outputs = inputs: import ./nix/outputs.nix {sources = inputs;};
}
