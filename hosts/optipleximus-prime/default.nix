{ config, lib, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  modules.development.enable = true;
}
