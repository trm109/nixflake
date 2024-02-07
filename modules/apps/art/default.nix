{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    inkscape-with-extensions # svg
    blender-hip # 3d modelling
    krita # photoshop clone
    #godot_4 # Game dev
  ];
}
