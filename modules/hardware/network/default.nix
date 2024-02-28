{ lib, config, hostname, username, ...}:
let
  cfg = config.modules.hardware.network;
in
{
  options.modules.hardware.network = {
    enable = lib.mkEnableOption "Enables Networking" // {
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    # Network
    networking = {
      hostName = "${hostname}";
      networkmanager.enable = true;
      nameservers = [ "8.8.8.8" "8.8.4.4" ];
    };

    # Enable ssh
    services.openssh.enable = true;

    # Reduces startup time ??
    #systemd.network.wait-online.enable = false;
    systemd.services.NetworkManager-wait-online.enable = false;
  };
}
