{ ... }:

{
  accounts.email = {

    maildirBasePath = "/data/pnm/mail";

    accounts = {
      mailo = {
        primary = true;
        address = "pnm@pnm.tf";
        realName = "Paul-Nicolas Madelaine";
        userName = "pnm@pnm.tf";
        passwordCommand = "cat /data/pnm/passwords/mailo";
        imap = { host = "mail.mailo.com"; };
        smtp = { host = "mail.mailo.com"; };

        thunderbird = {
          enable = true;
          profiles = [ "pnm" ];
        };

        mbsync = {
          enable = true;
          create = "maildir";
        };
        msmtp.enable = true;
        notmuch.enable = true;
      };
    };
  };

  programs.mbsync.enable = true;
  programs.msmtp.enable = true;
  programs.notmuch = {
    enable = true;
    hooks = { preNew = "mbsync --all"; };
  };

  programs.thunderbird = {
    profiles.pnm.isDefault = true;
    enable = true;
  };
}
