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
      hyprpaper
      hyprpicker

      grim
      slurp

      wl-clipboard
      brightnessctl
      libnotify

      lxqt.lxqt-policykit
      xdg-utils

      # Theming
      gtk3
      gnome.gnome-themes-extra
      #(catppuccin-gtk.override {
      #  accents = [ "mauve" ]; # You can specify multiple accents here to output multiple themes
      #  size = "compact";
      #  tweaks = [ "rimless" ]; # You can also specify multiple tweaks here
      #  variant = "mocha";
      #})
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
  
}
