{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    stremio
    mpv-unwrapped
  ];
}
