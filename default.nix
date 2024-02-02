{ pkgs, username, home-manager, ... }:
{
  imports = [
    home-manager.nixosModules.home-manager
    ./assets
    ./hosts
    ./modules
    ./users
  ];
  home-manager.users.${username}.home.stateVersion = "23.11";
  #programs.home-manager.enable = true;
  system.stateVersion = "23.11";
  nixpkgs.config.allowUnfree = true;
}
