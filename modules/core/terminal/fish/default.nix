{ pkgs, home-manager, username, ... }:
{
  environment.systemPackages = with pkgs; [
    mandoc
    wl-clipboard
  ];
}
