{
  config,
  pkgs,
  lib,
  system,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ../../nixos/profiles/base.nix
    ../../nixos/profiles/cachix.nix
    ../../nixos/profiles/sound.nix
    ../../nixos/profiles/vpn-inria.nix
    ../../nixos/profiles/xdg.nix
  ];

  networking.hostName = "latitude";

  services.fwupd.enable = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.loader = {
    timeout = 2;
    systemd-boot = {
      enable = true;
      configurationLimit = 10;
    };
    efi = {
      efiSysMountPoint = "/boot";
      canTouchEfiVariables = true;
    };
  };

  networking.useDHCP = false;
  networking.interfaces.wlp2s0.useDHCP = true;
  networking.interfaces.enp0s31f6.useDHCP = true;
  networking.networkmanager.enable = true;

  services.xserver = {
    enable = true;
    displayManager.startx.enable = true;
  };

  users.users.pnm = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.bash;
  };

  security.pam.services.swaylock = {
    text = "auth include login";
  };

  programs.steam.enable = true;
  nixpkgs.config.allowUnfree = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.11"; # Did you read the comment?
}
