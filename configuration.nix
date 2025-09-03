{ config, ... }:

let
  sources = import ./npins;
  pkgs = import sources.nixpkgs {
    config = {
      allowUnfree = true;
    };
  };

  disko = sources.disko;
  agenix = sources.agenix;
in
{
  _module.args.sources = sources;
  nixpkgs.pkgs = pkgs;

  imports = [
    ./hardware-configuration.nix

    "${disko}/module.nix"
    ./disko-config.nix

    "${agenix}/modules/age.nix"
    ./agenix-config.nix
    
    ./boot.nix
    ./settings.nix
    ./users.nix

    ./modules
  ];

  hardware.enableRedistributableFirmware = true;

  services.dbus = {
    enable = true;
    implementation = "broker";
  };
  services.thermald.enable = true;
  powerManagement.enable = true;

  environment.systemPackages = with pkgs; [
    (pkgs.callPackage "${agenix}/pkgs/agenix.nix" {})
    npins
  ];
  
  system.stateVersion = "25.05";
}
