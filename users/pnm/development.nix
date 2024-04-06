{pkgs, ...}: {
  home.packages = [
    # doom emacs
    pkgs.fd
    pkgs.fira-code
    pkgs.ripgrep

    # nix
    pkgs.nixfmt-rfc-style
  ];

  programs.emacs.enable = true;
}
