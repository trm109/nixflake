{
  imports = [
    ./systemd
  ];
  boot.crashDump.enable = true;
  #boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;
}
