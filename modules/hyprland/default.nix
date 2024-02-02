{ hyprland, pkgs, username, ... }:
{
  imports = [
    hyprland.nixosModules.default
    ./mako
    ./swaylock
    ./waybar
    ./wofi
  ];

  environment = {
    sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
      NIXOS_OZONE_WL = "1";
    };

    systemPackages = with pkgs; [
      grim
      slurp
      hyprpaper
      hyprpicker
      lxqt.lxqt-policykit
      wl-clipboard
      xdg-utils
      brightnessctl
    ];
  };

  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    dconf.enable = true;
  };

  services.gnome = {
    gnome-keyring.enable = true;
  };
  
  security.pam.services = {
    login.enableGnomeKeyring = true;
  };
  xdg.portal = {
    enable = true;
    config = {
      common = {
	default = [ "xdph" "gtk" ];
	"org.freedesktop.impl.portal.Secret" = [ "gnome-keyring" ];
      };
    };
  };
  
  home-manager.users.${username} = _: {
    home.file.".config/hypr/" = {
      recursive = true;
      source = ../../dotfiles/hypr;
    };
  };
}
