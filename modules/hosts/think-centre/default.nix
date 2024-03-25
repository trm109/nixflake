{ ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];
  #          ▗▄▄▄       ▗▄▄▄▄    ▄▄▄▖             saik@think-centre
  #          ▜███▙       ▜███▙  ▟███▛             -----------------
  #           ▜███▙       ▜███▙▟███▛              OS: NixOS 24.05.20240129.97b17f3 (Uakari) x86_64
  #            ▜███▙       ▜██████▛               Host: 10AY001YUS (ThinkCentre M73)
  #     ▟█████████████████▙ ▜████▛     ▟▙         Kernel: 6.1.75
  #    ▟███████████████████▙ ▜███▙    ▟██▙        Uptime: 9 mins
  #           ▄▄▄▄▖           ▜███▙  ▟███▛        Packages: 776 (nix-system), 392 (nix-user)
  #          ▟███▛             ▜██▛ ▟███▛         Shell: bash 5.2.21
  #         ▟███▛               ▜▛ ▟███▛          Display (HP 32 QHD): 2560x1440
  #▟███████████▛                  ▟██████████▙    Theme: Catppuccin-Mocha-Compact-Mauve-Dark [GTK2/3/4]
  #▜██████████▛                  ▟███████████▛    Terminal: /dev/pts/0
  #      ▟███▛ ▟▙               ▟███▛             CPU: Intel(R) Core(TM) i5-4570T (4) @ 3.60 GHz
  #     ▟███▛ ▟██▙             ▟███▛              GPU: Intel Xeon E3-1200 v3/4th Gen Core Processor Integrated Graphir
  #    ▟███▛  ▜███▙           ▝▀▀▀▀               Memory: 462.76 MiB / 7.59 GiB (6%)
  #    ▜██▛    ▜███▙ ▜██████████████████▛         Swap: 0 B / 8.80 GiB (0%)
  #     ▜▛     ▟████▙ ▜████████████████▛          Disk (/): 9.46 GiB / 107.65 GiB (9%) - ext4
  #           ▟██████▙       ▜███▙                Local IP (eno1): 192.168.50.247/24 *
  #          ▟███▛▜███▙       ▜███▙               Locale: en_CA.UTF-8
  #         ▟███▛  ▜███▙       ▜███▙    
  #         ▝▀▀▀    ▀▀▀▀▘       ▀▀▀▘              ████████████████████████
  #                                               ████████████████████████
  hardware.enableAllFirmware = true;
}
