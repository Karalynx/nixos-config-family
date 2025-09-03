{ pkgs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages_6_15;
  
  boot.loader = {
    grub = {
      enable = true;
      efiSupport = true;
      efiInstallAsRemovable = true;
      device = "nodev";
      
      splashImage = null;
    };
  };
  
  boot.kernelParams = [
    "ipv6.disable=1"
    "module.sig_enforce=1"
    "quiet"
    "loglevel=0"
    "init_on_alloc=1"
    "init_on_free=1"
    "page_alloc.shuffle=1"
    "randomize_kstack_offset=on"
    "random.trust_cpu=off"
    "vsyscall=none"
    "debugfs=off"
  ];
  boot.kernel.sysctl = {
    "kernel.dmesg_restrict" = 1;
    "kernel.printk" = "3 3 3 3";
    "kernel.unprivileged_bpf_disabled" = 1;
    "net.core.bpf_jit_harden" = 2;
    "dev.tty.ldisc_autoload" = 0;
    "vm.unprivileged_userfaultfd" = 0;
    "kernel.kexec_load_disabled" = 1;
    "kernel.sysrq" = 4;
    "kernel.unprivileged_userns_clone" = 0;
    "kernel.perf_event_paranoid" = 3;
    "kernel.yama.ptrace_scope" = 2;

    "net.ipv4.tcp_syncookies" = 1;
    "net.ipv4.tcp_rfc1337" = 1;
    "net.ipv4.tcp_timestamps" = 0;
    "net.ipv4.conf.all.rp_filter" = 1;
    "net.ipv4.conf.default.rp_filter" = 1;
  };
  environment.etc."modprobe.d/disable-network-protocols.conf" = {
    text = ''
      install dccp /bin/false
      install sctp /bin/false
      install rds /bin/false
      install tipc /bin/false
      install n-hdlc /bin/false
      install ax25 /bin/false
      install netrom /bin/false
      install x25 /bin/false
      install rose /bin/false
      install decnet /bin/false
      install econet /bin/false
      install af_802154 /bin/false
      install ipx /bin/false
      install appletalk /bin/false
      install psnap /bin/false
      install p8023 /bin/false
      install p8022 /bin/false
      install can /bin/false
      install atm /bin/false
    '';
  };
  environment.etc."modprobe.d/disable-filesystems.conf" = {
    text = ''
      install cramfs /bin/false
      install freevxfs /bin/false
      install jffs2 /bin/false
      install hfs /bin/false
      install hfsplus /bin/false
      install squashfs /bin/false
      install udf /bin/false
    '';
  };
}
