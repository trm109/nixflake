{ pkgs, username, ... }:
{
  #environment.systemPackages = with pkgs; [ lutris ];

  programs = {
    steam = {
      enable = true;
    };
  };

  # Enable Mesa Drivers
  hardware.opengl.extraPackages = [ pkgs.mesa.drivers ];

  # Input Remapper
  services.input-remapper.enable = true;
}
