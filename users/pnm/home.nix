{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./alacritty.nix
    ./development.nix
    ./email.nix
    ./firefox.nix
    ./git.nix
    ./persistence.nix
    ./sway.nix
  ];

  programs.home-manager.enable = true;

  home.username = "pnm";

  home.homeDirectory = "/home/pnm";

  home.packages = [pkgs.keepassxc pkgs.signal-desktop];

  home.sessionVariables = {
    EDITOR = "vim";
    BROWSER = "firefox";
  };

  programs.vim = {
    enable = true;
    settings = {};
  };

  programs.man = {enable = true;};

  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
    };
  };

  programs.bash = {
    enable = true;
    initExtra = ''
      if [ -x $(command -v tmux) ] && [ -n "$DISPLAY" ]
      then
        [ -z "$TMUX" ] && (tmux attach || tmux) >/dev/null 2>&1
      fi
    '';
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  home.stateVersion = "23.05";
}
