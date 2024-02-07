# users/saik/default.nix
{ lib, system, pkgs, username, ...}:
{
# Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.saik = {
    shell = pkgs.fish;
    isNormalUser = true;
    description = "saik";
    extraGroups = [ "networkmanager" "wheel" "input" "audio" "video" "render" "docker" "libvirtd" "vboxusers" ];
  };
  systemd.tmpfiles.rules = 
  let
    dotsDir = "/etc/nixos/users/saik/dotfiles";
    confs = [
      "fish"
      "kitty"
      "hypr"
      "mako"
      "swaylock"
      "waybar"
      "wofi"
    ];
  in
  map (conf_name: "L+ /home/${username}/.config/${conf_name}  -  -  -  - ${dotsDir}/${conf_name}") confs;

  home-manager.users.${username} = {config, lib, ...}: {
    home = {
      packages = with pkgs; [
	gitAndTools.gh
	git-lfs
	git
	fish
	kitty
	hypr
	mako
	swaylock
	waybar
	wofi

	neovim
	neofetch
	#input-remapper-2
      ];
# https://discourse.nixos.org/t/deploy-files-into-home-directory-with-home-manager/24018/2
    };
  };
}
