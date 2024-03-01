{ lib, config, pkgs, hostType, ... }:
let
  cfg = config.modules.apps.fun.video;
in
{
  options.modules.apps.fun.video = {
    enable = lib.mkEnableOption "Enables video apps" // {
      default = if hostType == "desktop" then true
	else if hostType == "server" then false
	else true;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      stremio
      mpv-unwrapped
    ];
  };
}
