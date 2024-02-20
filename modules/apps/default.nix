{ pkgs, home-manager, username, ... }:
{
  # Default Applications here.
  imports = [
    ./browser
    ./art
    ./school
    ./file_explorer
    #./fun
    #./virtualisation
  ];
  environment.systemPackages = with pkgs; [
    
  ];
}
