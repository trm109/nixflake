{ pkgs, home-manager, username, ... }:
{
  environment.systemPackages = with pkgs; [ swaylock ];
  security.pam.services = {
    swaylock = { };
  };
}
