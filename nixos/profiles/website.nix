{ config, pkgs, ... }:

let

  root = config.inputs.website.packages.${pkgs.system}.default;

in {

  services.nginx = {
    enable = true;
    virtualHosts."www.pnm.tf" = { inherit root; };
    virtualHosts."pnm.tf" = { inherit root; };
  };

  networking.firewall.allowedTCPPorts = [ 80 ];

}
