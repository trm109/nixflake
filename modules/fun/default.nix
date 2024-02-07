{ lib, gamingHost, pkgs, ... }:
{
  imports = [
    #(lib.mkIf gamingHost (./steam))
  ];
  environment.systemPackages = with pkgs; [
    stremio
  ];
}
