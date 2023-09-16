{ config, pkgs, ... }:

let

  keys = import ../../users/pnm/keys.nix;

in {

  imports = [ ./hardware-configuration.nix ../../nixos/profiles/base.nix ];

  services.nginx = {
    enable = true;
    virtualHosts."localhost" = {
      root = config.inputs.website.packages.${pkgs.system}.default;
    };
  };
  networking.firewall.allowedTCPPorts = [ 80 ];

  networking.hostName = "www";

  nix.settings.trusted-users = [ "root" "pnm" ];

  documentation.nixos.enable = false;

  boot.loader.grub = {
    enable = true;
    device = "/dev/xvda";
    configurationLimit = 1;
  };

  users.users.pnm = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.bash;
    openssh.authorizedKeys.keys = keys;
  };

  services.openssh.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
