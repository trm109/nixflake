{ config, lib, modulesPath, ... }:
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
  ### Nvidia
  modules.hardware.nvidia.enable = true;
  ### Printers
  modules.hardware.printers.enable = true;
}
