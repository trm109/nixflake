{ lib, config, pkgs, ... }:
let
  cfg = config.modules.apps.fun.minecraft;
in
{
  options.modules.apps.fun.minecraft = {
    enable = lib.mkEnableOption "Enables minecraft";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      (prismlauncher.override { jdks = [ jdk8 jdk17 ]; })
    ];
  };
}
