{ lib, config, pkgs, hostType, ... }:
let
  cfg = config.modules.apps.fun.social;
in
{
  options.modules.apps.fun.social = {
    enable = lib.mkEnableOption "Enables social apps" // {
      default = if hostType == "desktop" then true
	else if hostType == "server" then false
	else true;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      discord
    ];
  };
}
