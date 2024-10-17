{ config, pkgs, ... }:
{
  imports = [
    ./alacritty.nix
    ./development.nix
    ./git.nix
  ];

  programs.home-manager.enable = true;

  home.username = "pnm";

  home.homeDirectory = "/home/pnm";

  home.packages = builtins.attrValues {
    inherit (pkgs)
      keepassxc
      mpv
      zathura
      ;

    inherit (pkgs)
      jless
      jq
      python3
      tree
      unzip
      ;
  };

  programs.vim = {
    enable = true;
    settings = { };
  };

  programs.man = {
    enable = true;
  };

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
    initExtra = ''
      cdd() {
          TARGET=$(readlink -e "''${1:-"~"}")
          X="$TARGET"
          while [ "$X" != "/" ]
          do
              if [ -f "$X/shell.nix" ]
              then
                  echo 'use nix' > "$X/.envrc"
                  break
              fi
              X=$(dirname "$X")
          done
          cd "$TARGET"
      }
      c() {
          ${pkgs.xclip}/bin/xclip -selection clipboard
      }
    '';
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

  programs.ssh.enable = true;

  home.stateVersion = "23.05";
}
