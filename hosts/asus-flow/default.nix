{
  imports = [
    ./hardware-configuration.nix
  ];
  # Use systemd-boot EFI boot loader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # CPU/GPU Undervolting
  #programs.corectrl.enable = true;
  systemd.extraConfig = ''
    DefaultTimeoutStopSec=5s
    '';
}
