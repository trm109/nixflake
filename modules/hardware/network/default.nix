{ hostname, username, ...}:
{
  # Network
  networking = {
    hostName = "${hostname}";
    networkmanager.enable = true;
    nameservers = [ "8.8.8.8" "8.8.4.4" ];
  };

  # Enable ssh
  services.openssh.enable = true;
}
