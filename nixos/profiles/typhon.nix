{
  config,
  pkgs,
  ...
}: {
  #services.typhon = {
  #  enable = true;
  #  hashedPassword = "265ce51f01760e8d6930871d0a52f06cdd6d10751e8d6bd17ed1086a1d16ff51";
  #  domain = "pnm.tf";
  #  webroot = "/typhon";
  #  https = true;
  #};

  services.nginx = {
    virtualHosts."typhon-ci.org" = {
      addSSL = true;
      enableACME = true;
      root = config.inputs.typhon.packages.${pkgs.system}.typhon-doc;
      serverAliases = ["www.typhon-ci.org"];
    };
  };
}
