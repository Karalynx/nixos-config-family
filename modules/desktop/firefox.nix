{ ... }:

{
  programs.firefox = {
    enable = true;
    languagePacks = ["lt" "en-US"];
    
    policies = {
      RequestedLocales = ["lt" "en-US"];
      
      BlockAboutConfig = true;
      BlockAboutProfiles = true;
      BlockAboutSupport = true;

      NoDefaultBookmarks = true;
      PictureInPicture = {
        Enabled = false;
        Locked = true;
      };
      HttpsOnlyMode = "force_enabled";
      
      DisableTelemetry = true;
      DisableFirefoxStudies = true;

      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };

      DisablePocket = true;
      DisableFirefoxAccounts = true;
      DisableAccounts = true;
      DisableFirefoxScreenshots = true;
      DontCheckDefaultBrowser = true;

      Permissions = {
        Notifications = {
          BlockNewRequests = true;
          Locked = true;
        };
        VirtualReality = {
          BlockNewRequests = true;
          Locked = true;
        };
        Autoplay = {
          Default = "block-audio-video";
          Locked = true;
        };
      };

      Bookmarks = [
        {
          Title = "Facebook";
          URL = "https://www.facebook.com";
          Favicon = "https://www.facebook.com/favicon.ico";
          Placement = "toolbar";
        }
        {
          Title = "Youtube";
          URL = "https://www.youtube.com";
          Favicon = "https://www.youtube.com/favicon.ico";
          Placement = "toolbar";
        }
        {
          Title = "Gmail";
          URL = "https://mail.google.com";
          Favicon = "https://mail.google.com/favicon.ico";
          Placement = "toolbar";
        }
        {
          Title = "Delfi";
          URL = "https://www.delfi.lt";
          Favicon = "https://www.delfi.lt/favicon.ico";
          Placement = "toolbar";
        }
      ];

      SearchEngines = {
        PreventInstalls = true;
        Default = "DuckDuckGo";
        Remove = ["Google" "Bing"];
      };
      
      ExtensionSettings = {
        "*".installation_mode = "blocked";
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
        };
      };
    };
    preferences = {      
      "network.trr.mode" = 2;

      "browser.newtabpage.activity-stream.feeds.topsites" = false;
      "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;      

      "browser.urlbar.suggest.engines" = false;
      "browser.urlbar.suggest.topsites" = false;
      "browser.urlbar.suggest.trending" = false;
      "browser.urlbar.suggest.quickactions" = false;     

      "privacy.fingerprintingProtection" = true;
      "privacy.globalprivacycontrol.enabled" = true;
    };
  };
}
