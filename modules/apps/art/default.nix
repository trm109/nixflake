{ lib, config, pkgs, ... }:
let 
  cfg = config.modules.apps.art;
in
{
  options.modules.apps.art = {
    enable = lib.mkEnableOption "Enables art apps" // {
      default = true;
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
