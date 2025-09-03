{ sources, ... }:

{
  nix.nixPath = [
    "nixpkgs=${sources.nixpkgs}"
    "nixos-config=/etc/nixos/configuration.nix"
  ];
  nix.channel.enable = false;
  
  nix.settings.allowed-users = ["@wheel"];
  nix.settings.auto-optimise-store = true;
  nix.optimise.automatic = true;

  nix.gc = { 
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 3d";
  };
}
