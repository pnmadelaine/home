{ config, pkgs, ... }:

{

  services.nginx = {
    enable = true;
    virtualHosts."pnm.tf" = {
      root = config.inputs.website.packages.${pkgs.system}.default;
      serverAliases = [ "www.pnm.tf" ];
    };
  };

  networking.firewall.allowedTCPPorts = [ 80 ];

}
