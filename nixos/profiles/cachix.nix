{ ... }:
{
  nix.settings = {
    substituters = [
      "https://typhon.cachix.org/"
      "https://hacl.cachix.org/"
    ];
    trusted-public-keys = [
      "typhon.cachix.org-1:pTBj6pvE2jaXZ43iTor6oDng3nbZwxn5uLNQVd13dIg="
      "hacl.cachix.org-1:FzsZ2xsByOwKwIWNPII7yMOelJNDZ12mDAj3d1eGX0c="
    ];
  };
}
