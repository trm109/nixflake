{ pkgs, home-manager, username, ... }:
{
  environment.systemPackages = with pkgs; [ swaylock ];
  home-manager.users.${username} = _: {
    home.file.".config/swaylock/" = {
      recursive = true;
      source = ../../../dotfiles/swaylock;
    };
  };
  security.pam.services = {
    swaylock = { };
  };
}
