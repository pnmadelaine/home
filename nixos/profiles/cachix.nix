{ ... }:
{
  nix.settings = {
    substituters = [
      "https://typhon.cachix.org/"
    ];
    trusted-public-keys = [
      "typhon.cachix.org-1:pTBj6pvE2jaXZ43iTor6oDng3nbZwxn5uLNQVd13dIg="
    ];
  };
}
