{ pkgs, home-manager, username, ... }:
{
  environment.systemPackages = with pkgs; [ wofi ];
  home-manager.users.${username} = _: {
    home.file.".config/wofi/" = {
      recursive = true;
      source = ../../../dotfiles/wofi;
    };
  };
}
