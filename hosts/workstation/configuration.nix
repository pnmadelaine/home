{...}: {
  imports = [
    ./hardware-configuration.nix
    ../../nixos/profiles/base.nix
    ../../nixos/profiles/cache-inria.nix
    ../../nixos/profiles/cachix.nix
    ../../nixos/profiles/docker.nix
    ../../nixos/profiles/sound.nix
    ../../nixos/profiles/xdg.nix
  ];

  networking.hostName = "workstation";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  services.xserver = {
    enable = true;
    displayManager.startx.enable = true;
  };

  users.users.pnm = {
    isNormalUser = true;
    extraGroups = ["wheel"];
  };

  security.pam.services.swaylock = {text = "auth include login";};

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?
}
