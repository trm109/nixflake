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
  #          ▗▄▄▄       ▗▄▄▄▄    ▄▄▄▖             saik@asus-flow
  #          ▜███▙       ▜███▙  ▟███▛             --------------
  #           ▜███▙       ▜███▙▟███▛              OS: NixOS 24.05.20240129.97b17f3 (Uakari) x86_64
  #            ▜███▙       ▜██████▛               Host: ROG Flow X16 GV601RM_GV601RM (1.0)
  #     ▟█████████████████▙ ▜████▛     ▟▙         Kernel: 6.1.75
  #    ▟███████████████████▙ ▜███▙    ▟██▙        Uptime: 24 mins
  #           ▄▄▄▄▖           ▜███▙  ▟███▛        Packages: 1642 (nix-system), 392 (nix-user)
  #          ▟███▛             ▜██▛ ▟███▛         Shell: fish 3.7.0
  #         ▟███▛               ▜▛ ▟███▛          Display (AUO8E9D): 2560x1600 @ 165Hz [Built-in]
  #▟███████████▛                  ▟██████████▙    WM: Hyprland (Wayland)
  #▜██████████▛                  ▟███████████▛    Theme: Catppuccin-Mocha-Compact-Mauve-Dark [GTK2/3/4]
  #      ▟███▛ ▟▙               ▟███▛             Terminal: .kitty-wrapped
  #     ▟███▛ ▟██▙             ▟███▛              CPU: AMD Ryzen 7 6800HS (16) @ 4.78 GHz
  #    ▟███▛  ▜███▙           ▝▀▀▀▀               GPU 1: AMD Radeon 680M
  #    ▜██▛    ▜███▙ ▜██████████████████▛         GPU 2: NVIDIA GeForce RTX 3060 Mobile / Max-Q
  #     ▜▛     ▟████▙ ▜████████████████▛          Memory: 3.76 GiB / 30.63 GiB (12%)
  #           ▟██████▙       ▜███▙                Swap: Disabled
  #          ▟███▛▜███▙       ▜███▙               Disk (/): 87.06 GiB / 953.74 GiB (9%) - btrfs
  #         ▟███▛  ▜███▙       ▜███▙              Disk (/mnt/ADATA): 562.39 GiB / 952.87 GiB (59%) - btrfs
  #         ▝▀▀▀    ▀▀▀▀▘       ▀▀▀▘              Local IP (eth0): 192.168.50.83/24 *
  #                                               Battery: 86% [Charging]
  #                                               Locale: en_CA.UTF-8
  #
  #                                               ████████████████████████
  #                                               ████████████████████████
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
  modules.hardware.nvidia.enable = lib.mkDefault true;
  ### Printers
  modules.hardware.printers.enable = true;


  # Specialisations
  ## TODO Add in RyzenAdj perf stuff
  ## TODO Validate supergfx mods
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
