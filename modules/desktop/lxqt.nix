{ ... }:

{
  services.xserver = {
    xkb.layout = "us,lt";
    xkb.variant = "";
    xkb.options = "grp:alt_shift_toggle";
  };
  
  services.xserver.enable = true;
  services.xserver.desktopManager.lxqt.enable = true;
  
  services.xserver.displayManager.lightdm.enable = true;
  services.displayManager.autoLogin = {
    enable = true;
    user = "zilvinas";
  };

  programs.nm-applet.enable = true;
}
