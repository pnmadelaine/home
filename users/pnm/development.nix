{ pkgs, ... }:

{
  home.packages = [
    # doom emacs
    pkgs.fd
    pkgs.fira-code
    pkgs.ripgrep

    # nix
    pkgs.alejandra
  ];

  programs.emacs.enable = true;
}
