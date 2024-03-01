{ config, lib, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  virtualisation.docker.enable = true;
}
