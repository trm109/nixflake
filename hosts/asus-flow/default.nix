{ config, lib, ... }:
{
  imports = [
    ./hardware-configuration.nix
    # Apps (Standard + Fun + Steam)
    # Hyprland
    # Development
    # Asus
    # Nvidia
    # Printer
  ];

  ## Apps
  ### Steam
  modules.apps.fun.steam.enable = true;
  ### Minecraft
  modules.apps.fun.minecraft.enable = true;

  ## Core

  ## Desktops
  ### Hyprland
  modules.desktop.hyprland.enable = true;

  ## Development
  modules.development.enable = true;
  
  ## Hardware
  ### Asus Specific
  modules.hardware.asus.enable = true;
  ### Nvidia (CONDITIONAL, specialisation based)
  ### Printers
  modules.hardware.printers.enable = true;


  # Specialisations
  specialisation = {
    # Plugged in, high performance, high power draw.
    performance.configuration = {
      system.nixos.tags = [ "performance" ];
      modules.hardware.nvidia.enable = true;
    };
    # Hybrid configuration, med performance, med power draw.
    hybrid.configuration = {
      system.nixos.tags = [ "hybrid" ];
      modules.hardware.nvidia.enable = true;
    };
    # Low power, high efficiency
    efficience.configuration = {
      system.nixos.tags = [ "efficience" ];
      modules.hardware.nvidia.enable = false;
    };
  };
}
