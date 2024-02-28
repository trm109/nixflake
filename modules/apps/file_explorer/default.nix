# /etc/nixos/modules/apps/file_explorer/default.nix
{ lib, config, pkgs, ... }:
let
  cfg = config.modules.apps.fileExplorer;
in
{
  options.modules.apps.fileExplorer = {
    enable = lib.mkEnableOption "Enables the Thunar File Explorer" // {
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    programs.thunar.enable = true;
    programs.xfconf.enable = true;
    programs.thunar.plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
    ];
    services.gvfs.enable = true; # Mount, trash, and other functionalities
    services.tumbler.enable = true; # Thumbnail support for images
  };
}
