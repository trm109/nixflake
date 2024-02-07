{ lib, gamingHost, pkgs, ... }:
{
  imports = [
    #./steam
    ./video
    ./social
    ./music
    #./minecraft
  ];
  environment.systemPackages = with pkgs; [
    # Social
    #discord
    
    # Video
    #stremio
    #mpv-unwrapped

    # Music
    #spotify

    # Minecraft
    #(prismlauncher.override { jdks = [ jdk8 jdk17 ]; })

  ];
}
