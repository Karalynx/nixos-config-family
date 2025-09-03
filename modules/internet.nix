{ config, ... }:

{
  networking.hostName = "zilvinas";
  networking.networkmanager = {
    enable = true;
    wifi.powersave = true;
    ensureProfiles.profiles = {
      home-wifi = {
        connection = {
          id = "home-wifi";
          type = "wifi";
        };
        wifi = {
          mode = "infrastructure";
          ssid = "TP_nomap_optout_nosniff_nospoof";
        };
        wifi-security = {
          auth-alg = "open";
          key-mgmt = "wpa-psk";
          psk = builtins.readFile config.age.secrets.home-wifi.path;
        };
      };
    };
  };
}
