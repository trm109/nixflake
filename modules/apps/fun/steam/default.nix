{ lib, config, pkgs, username, ... }:
let
  cfg = config.modules.apps.fun.steam;
in
{
  options.modules.apps.fun.steam = {
    enable = lib.mkEnableOption "Enables Steam and Steam Tweaks";
  };

  config = lib.mkIf cfg.enable {
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
  };
}
