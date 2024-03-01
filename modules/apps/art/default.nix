{ lib, config, pkgs, hostType, ... }:
let 
  cfg = config.modules.apps.art;
in
{
  options.modules.apps.art = {
    enable = lib.mkEnableOption "Enables art apps" // {
      default = if hostType == "desktop" then true
	else if hostType == "server" then false
	else true;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      inkscape-with-extensions # svg
      blender-hip # 3d modelling
      krita # photoshop clone
    ];
  };
}
