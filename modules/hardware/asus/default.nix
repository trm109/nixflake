{
  # Enable supergfxd
  services.supergfxd.enable = true;

  # Enable asusd
  services = {
      asusd = {
        enable = true;
        enableUserService = true;
      };
  };
  # Other settings
  #programs.rog-control-center.autoStart = false;
}
