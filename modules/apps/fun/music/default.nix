{ lib, config, pkgs, hostType, ... }:
let
  cfg = config.modules.apps.fun.music;
in
{
  options.modules.apps.fun.music = {
    enable = lib.mkEnableOption "Enable music apps" // {
      default = if hostType == "desktop" then true
	else if hostType == "server" then false
	else true;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      spotify
    ];
  };
}
