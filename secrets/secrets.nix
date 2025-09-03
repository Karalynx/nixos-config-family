let
  lenovo = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIN7/5qodGC9usEYjCybE+5GLGUh4VuPucIzPvvBIcc/q";
  systems = [ lenovo ];
in {
  "home-wifi.age".publicKeys = systems;
  "zilvinas.age".publicKeys = systems;
}
