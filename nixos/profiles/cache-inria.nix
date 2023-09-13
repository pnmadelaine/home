{ ... }:

{
  nix.settings = {
    substituters = [ "https://everest-ci.paris.inria.fr/cache/" ];
    trusted-public-keys = [
      "everest-ci.paris.inria.fr:aL1Ya9KnpGXqnpjLjwV9E/MmaHYujLF90cNatMCJ1BY="
    ];
  };
}
