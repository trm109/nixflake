{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    discord
  ];
  #systemd.shutdown."force_kill_discord.sh" = pkgs.writeScript "force_kill_discord.sh" ''
  #    #!/bin/sh
  #    pkill .Discord-wrappe
  #  ''; 
}
