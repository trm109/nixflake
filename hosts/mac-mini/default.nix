{
  imports = [
    ./hardware-configuration.nix
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
}
