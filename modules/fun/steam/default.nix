{ pkgs, username, ... }:
{
  #environment.systemPackages = with pkgs; [ lutris ];

  # This can optionally be installed via flatpack. 
  # Proton Experimental is pretty sweet
  programs = {
    steam.enable = true;
  };
}
