{
  config,
  pkgs,
  ...
}: {
  services.nginx = {
    enable = true;
    virtualHosts."pnm.tf" = {
      addSSL = true;
      enableACME = true;
      root = config.inputs.website.packages.${pkgs.system}.default;
      serverAliases = ["www.pnm.tf"];
    };
  };

  security.acme = {
    acceptTerms = true;
    defaults.email = "pnm@pnm.tf";
  };

  networking.firewall.allowedTCPPorts = [80 443];
}
