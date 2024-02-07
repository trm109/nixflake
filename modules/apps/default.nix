{ pkgs, home-manager, username, ... }:
{
  # Default Applications here.
  imports = [
    ./browser
    ./art
    ./school
    #./fun
    #./virtualisation
  ];
  environment.systemPackages = with pkgs; [
    
  ];
}
