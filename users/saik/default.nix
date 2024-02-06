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
      file =
      let
      	link = config.lib.file.mkOutOfStoreSymlink;
      in {
	".config/hypr".source 		= link ./dotfiles/hypr;
	".config/kitty".source 		= link ./dotfiles/kitty;
	".config/mako".source 		= link ./dotfiles/mako;
	".config/swaylock".source 	= link ./dotfiles/swaylock;
	".config/waybar".source 	= link ./dotfiles/waybar;
	".config/wofi".source 		= link ./dotfiles/wofi;
	#".config/
      }; 
    };
  };
}
