{ home-manager, username, ... }:
{
  home-manager.users.${username} = _: {
    home.file.".config/kitty/" = {
      recursive = true;
      source = ../../../../../dotfiles/kitty;
    };
  };
}
