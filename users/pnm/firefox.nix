{
  pkgs,
  lib,
  ...
}: {
  programs.firefox = {
    enable = true;
    profiles = {
      pnm = {
        settings = let
          homepage = "https://lichess.org/training";
        in {
          "app.shield.optoutstudies.enabled" = false;
          "browser.aboutConfig.showWarning" = false;
          "browser.newtabpage.activity-stream.feeds.topsites" = false;
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
          "browser.shell.checkDefaultBrowser" = false;
          "browser.startup.homepage" = homepage;
          "browser.urlbar.trimURLs" = false;
          "datareporting.healthreport.uploadEnabled" = false;
          "extensions.formautofill.creditCards.enabled" = false;
          "intl.regional_prefs.use_os_locales" = true;
          "layout.spellcheckDefault" = 0;
          "signon.autofillForms" = false;
          "signon.generation.enabled" = false;
          "signon.management.page.breach-alerts.enabled" = false;
          "signon.rememberSignons" = false;
        };
        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          clearurls
          floccus
          foxyproxy-standard
          i-dont-care-about-cookies
          keepassxc-browser
          noscript
          ublock-origin
        ];
      };
    };
  };
}
