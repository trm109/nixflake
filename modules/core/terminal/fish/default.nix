{ pkgs, home-manager, username, ... }:
{
  home-manager.users.${username} = _: {
    programs.fish = {
      enable = true;
    };
    # home.file.".config/fish/" = {
    #   recursive = true;
    #   source = ../../../../dotfiles/fish;
    # };
  };
}
