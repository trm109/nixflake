{ lib, config, pkgs, ... }:
let
  cfg = config.modules.apps.fun.social;
in
{
  options.modules.apps.fun.social = {
    enable = lib.mkEnableOption "Enables social apps" // {
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      discord
    ];
  };
}
