{ home-manager, username, ... }:
{
  home-manager.users.${username} = _: {
    home.file = {
      # Dunno why this doesn't work.
      #".config/backgrounds".source = ./backgrounds;
    };
  };
}
