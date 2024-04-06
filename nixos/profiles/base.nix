{ config, pkgs, ... }:
{
  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optimise-store = true;
      trusted-users = [ "@wheel" ];
    };
    gc = {
      automatic = true;
      dates = "daily";
    };
  };

  programs.command-not-found.enable = false;

  time.timeZone = "Europe/Paris";
  i18n.defaultLocale = "en_IE.UTF-8";

  console = {
    font = "Lat2-Terminus16";
    keyMap = "fr-bepo";
  };

  services.timesyncd.enable = true;

  environment.systemPackages = [
    pkgs.file
    pkgs.git
    pkgs.htop
    pkgs.pciutils
    pkgs.tmux
    pkgs.vim
    pkgs.wget
  ];
}
