{ pkgs, ... }:

{
  home.packages = [
    # doom emacs
    pkgs.ripgrep
    pkgs.fd

    # nix
    pkgs.nixfmt
  ];

  programs.emacs.enable = true;
}
