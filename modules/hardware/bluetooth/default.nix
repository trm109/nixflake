{ lib, config, ... }:
let
  cfg = config.modules.hardware.bluetooth;
in
{
  options.modules.hardware.bluetooth = {
    enable = lib.mkEnableOption "Enables bluetooth support" // {
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    # Bluetooth
    hardware.bluetooth.enable = true;
    services.blueman.enable = true;
    hardware.bluetooth.powerOnBoot = true;
  };
}
