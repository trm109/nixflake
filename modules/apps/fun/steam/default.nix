{ pkgs, username, ... }:
{
  #environment.systemPackages = with pkgs; [ lutris ];

  # Steam
  programs.steam.enable = true;

  # Enable Mesa Drivers
  hardware.opengl.extraPackages = [ pkgs.mesa.drivers ];

  # Input Remapper
  services.input-remapper.enable = true;
  
  # Gamemode
  programs.gamemode.enable = true;

  # Extra packages
  environment.systemPackages = with pkgs; [
    mangohud
  ];
}
