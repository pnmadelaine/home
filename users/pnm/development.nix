{ pkgs, ... }:

{
  home.packages = [
    # doom emacs
    pkgs.fd
    pkgs.fira-code
    pkgs.ripgrep

    # nix
    pkgs.nixfmt
  ];

  programs.emacs.enable = true;
}
