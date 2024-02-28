{ lib, config, pkgs, username, ... }:
let
  cfg = config.modules.hardware.audio;
in
{
  options.modules.hardware.audio = {
    enable = lib.mkEnableOption "Enables audio" // {
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    # Audio
    sound.enable = true;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
      wireplumber.enable = true;
    };
    environment.systemPackages = with pkgs; [
      pavucontrol
      helvum
    ];
  };
}
