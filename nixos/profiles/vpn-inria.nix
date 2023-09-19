{...}: {
  networking.openconnect.interfaces.vpninria0 = {
    gateway = "vpn.inria.fr";
    protocol = "anyconnect";
    user = "pmadelai";
    passwordFile = "/var/lib/secrets/inria/password.txt";
  };
}
