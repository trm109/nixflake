# users/saik/default.nix
{ config, lib, system, pkgs, username, ...}:
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
        gh
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
        bc
#input-remapper-2
      ];
      #sessionVariables.GTK_THEME = "Catppuccin-Mocha-Standard-Blue-dark";
# https://discourse.nixos.org/t/deploy-files-into-home-directory-with-home-manager/24018/2
    };
    gtk = {
      enable = true;
      theme = {
	#name = "Adwaita-dark";
	#package = pkgs.gnome.gnome-themes-extra;
        name = "Catppuccin-Mocha-Compact-Mauve-Dark";
        package = pkgs.catppuccin-gtk.override {
	  accents = [ "mauve" ];
	  size = "compact";
	  tweaks = [ "rimless" ];
	  variant = "mocha";
	};
      };
    };

    dconf = {
      enable = true;
      settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
    };
  };
  #systemd.user.sessionVariables = config.home-manager.users.${username}.home.sessionVariables;
}
