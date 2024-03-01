{ lib, config, pkgs, hostType, ... }:
let 
  cfg = config.modules.apps.work;
in
{
  options.modules.apps.work = {
    enable = lib.mkEnableOption "Enables work suite apps" // {
      default = if hostType == "desktop" then true
	else if hostType == "server" then false
	else true;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      zoom-us
      libreoffice
    ];
  };
}
