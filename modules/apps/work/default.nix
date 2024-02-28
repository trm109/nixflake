{ lib, config, pkgs, ... }:
let 
  cfg = config.modules.apps.work;
in
{
  options.modules.apps.work = {
    enable = lib.mkEnableOption "Enables work suite apps" // {
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      zoom-us
      libreoffice
    ];
  };
}
