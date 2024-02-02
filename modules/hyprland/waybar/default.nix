{ pkgs, home-manager, username, ... }:
{
  environment.systemPackages = with pkgs; [ waybar ];
  home-manager.users.${username} = _: {
    home.file.".config/waybar/" = {
      recursive = true;
      source = ../../../dotfiles/waybar;
    };
  };
}
