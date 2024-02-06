{ pkgs, home-manager, username, ... }:
{
  home-manager.users.${username} = _: {
    programs.fish = {
      enable = true;
    };
  };
}
