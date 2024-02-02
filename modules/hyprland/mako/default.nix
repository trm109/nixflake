{ pkgs, home-manager, username, ... }:
{
  environment.systemPackages = with pkgs; [ mako ];
  home-manager.users.${username} = _: {
    home.file.".config/mako/" = {
      recursive = true;
      source = ../../../dotfiles/mako;
    };
  };
}
