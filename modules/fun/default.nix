{ pkgs, ... }:
{
  imports = [
    ./steam
  ];
  environment.systemPackages = with pkgs; [
    stremio
  ];
}
