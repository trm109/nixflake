{ config, lib, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];
  #          ▗▄▄▄       ▗▄▄▄▄    ▄▄▄▖             saik@optipleximus-prime
  #          ▜███▙       ▜███▙  ▟███▛             -----------------------
  #           ▜███▙       ▜███▙▟███▛              OS: NixOS 24.05.20240129.97b17f3 (Uakari) x86_64
  #            ▜███▙       ▜██████▛               Host: OptiPlex 3040
  #     ▟█████████████████▙ ▜████▛     ▟▙         Kernel: 6.1.75
  #    ▟███████████████████▙ ▜███▙    ▟██▙        Uptime: 41 seconds
  #           ▄▄▄▄▖           ▜███▙  ▟███▛        Packages: 757 (nix-system), 392 (nix-user)
  #          ▟███▛             ▜██▛ ▟███▛         Shell: fish 3.7.0
  #         ▟███▛               ▜▛ ▟███▛          Theme: Catppuccin-Mocha-Compact-Mauve-Dark [GTK2/3/4]
  #▟███████████▛                  ▟██████████▙    Terminal: /dev/pts/0
  #▜██████████▛                  ▟███████████▛    CPU: Intel(R) Core(TM) i3-6100T (4) @ 3.20 GHz
  #      ▟███▛ ▟▙               ▟███▛             GPU: Intel HD Graphics 530
  #     ▟███▛ ▟██▙             ▟███▛              Memory: 1.71 GiB / 7.67 GiB (22%)
  #    ▟███▛  ▜███▙           ▝▀▀▀▀               Swap: 0 B / 8.80 GiB (0%)
  #    ▜██▛    ▜███▙ ▜██████████████████▛         Disk (/): 21.09 GiB / 107.65 GiB (20%) - ext4
  #     ▜▛     ▟████▙ ▜████████████████▛          Local IP (enp2s0): 192.168.50.188/24 *
  #           ▟██████▙       ▜███▙                Locale: en_CA.UTF-8
  #          ▟███▛▜███▙       ▜███▙    
  #         ▟███▛  ▜███▙       ▜███▙              ████████████████████████
  #         ▝▀▀▀    ▀▀▀▀▘       ▀▀▀▘              ████████████████████████
  virtualisation.docker.enable = true;
}
