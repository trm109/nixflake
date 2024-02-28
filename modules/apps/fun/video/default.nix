{ lib, config, pkgs, ... }:
let
  cfg = config.modules.apps.fun.video;
in
{
  options.modules.apps.fun.video = {
    enable = lib.mkEnableOption "Enables video apps" // {
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      stremio
      mpv-unwrapped
    ];
  };
}
