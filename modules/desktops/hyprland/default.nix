{ lib, config, hyprland, pkgs, username, ... }:
let
  cfg = config.modules.desktop.hyprland;
in
{
  imports = [
    #hyprland.nixosModules.default
    ./mako
    ./swaylock
    ./waybar
    ./wofi
  ];

  options.modules.desktop.hyprland = {
    enable = lib.mkEnableOption "Enables Hyprland" // {
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    #config.desktop.isWayland = true;
    
    # Environment Level Configs
    environment = {
      # session vars
      sessionVariables = {
	WLR_NO_HARDWARE_CURSORS = "1";
	NIXOS_OZONE_WL = "1";
	MOZ_ENABLE_WAYLAND = "1";
      };
      # packages
      systemPackages = with pkgs; [
	hyprpaper
	hyprpicker

	grim
	slurp

	wl-clipboard
	brightnessctl
	libnotify

	xdg-utils

	gtk3
	gnome.gnome-themes-extra
      ];
    };

    # Enable Hyprland
    programs = {
      hyprland = {
	enable = true;
	xwayland.enable = true;
      };
      dconf.enable = true;
    };

    # Gnome Keyring
    services.gnome = {
      gnome-keyring.enable = true;
    };
    security.pam.services = {
      login.enableGnomeKeyring = true;
    };

    # Polkit
    security.polkit.enable = true;
    systemd = {
      user.services.polkit-gnome-authentication-agent-1 = {
	description = "polkit-gnome-authentication-agent-1";
	wantedBy = [ "graphical-session.target" ];
	wants = [ "graphical-session.target" ];
	after = [ "graphical-session.target" ];
	serviceConfig = {
	  Type = "simple";
	  ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
	  Restart = "on-failure";
	  RestartSec = 1;
	  TimeoutStopSec = 10;
	};
      };
    };
    

    # Enable xdg portal
    xdg.portal = {
      enable = true;
      config = {
	common = {
	  default = [ "xdph" "gtk" ];
	  "org.freedesktop.impl.portal.Secret" = [ "gnome-keyring" ];
	};
      };
    };

    # Enable SDDM
    services.xserver = {
      enable = true;
      displayManager = {
	sddm.enable = true;
	sddm.theme = "${import ./catppuccin-sddm-theme.nix { inherit pkgs; }}/share/sddm/themes/catppuccin-mocha";
      };
    };
  };
}
