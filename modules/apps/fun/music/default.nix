{ lib, config, pkgs, ... }:
let
  cfg = config.modules.apps.fun.music;
in
{
  options.modules.apps.fun.music = {
    enable = lib.mkEnableOption "Enable music apps" // {
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      spotify
    ];
  };
}
