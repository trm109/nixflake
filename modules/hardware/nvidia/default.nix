{ config, pkgs, ... }:
{
  # Enable OpenGL
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
  
  services.xserver.videoDrivers = [ "amdgpu" "nvidia"];
  
  hardware.nvidia = {

    modesetting.enable = true;

    nvidiaSettings = true;

    package = config.boot.kernelPackages.nvidiaPackages.production;
  };

  services.switcherooControl.enable = true;
}
