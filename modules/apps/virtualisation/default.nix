{ lib, config, ... }:
let
  cfg = config.modules.apps.virtualisation;
in
{
  options.modules.apps.virtualisation = {
    enable = lib.mkEnableOption "Enables virtualisation tools";
  };

  config = lib.mkIf cfg.enable {
    virtualisation.virtualbox = {
      host.enable = true;
      host.enableExtensionPack = true;
      guest.enable = true;
    };
  };
}
