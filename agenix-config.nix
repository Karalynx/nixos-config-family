{ ... }:

{
  age = {
    identityPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
    secrets = {  
      home-wifi = {
        file = ./secrets/home-wifi.age;
        owner = "root";
        mode = "0400";
      };
      zilvinas = {
        file = ./secrets/zilvinas.age;
        owner = "root";
        mode = "0400";
      };
    };
  };
}