{
  # Enable supergfxd
  services.supergfxd.enable = true;

  # Enable asusd
  services.asusd.enable = true;
  services.asusd.enableUserService = true;

  # Other settings
  programs.rog-control-center.autoStart = false;
}
