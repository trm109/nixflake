{ pkgs, ... }:
{
  # Enabling Nvidia Support
  hardware = {
    opengl.enable = true;
    nvidia.modesetting.enable = true;
  }

  # For Hyprland
  programs.hyprland.enableNvidiaPatches = true;
}
