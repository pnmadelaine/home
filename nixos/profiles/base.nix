{ config, pkgs, ... }:

{
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 7d";
    };
    inherit (config) registry nixPath;
  };

  programs.command-not-found.enable = false;

  time.timeZone = "Europe/Paris";
  i18n.defaultLocale = "en_IE.UTF-8";

  console = {
    font = "Lat2-Terminus16";
    keyMap = "fr-bepo";
  };

  services.timesyncd.enable = true;

  environment.systemPackages = with pkgs; [
    file
    git
    htop
    pciutils
    tmux
    vim
    wget
  ];
}