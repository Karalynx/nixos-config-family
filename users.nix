{ config, ... }:

{
  users.users."zilvinas" = {
    isNormalUser = true;
    description = "Žilvinas";
    hashedPasswordFile = config.age.secrets.zilvinas.path;
    extraGroups = [ "wheel" "networkmanager" ];
  };
}
