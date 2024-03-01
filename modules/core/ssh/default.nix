{ username, ... }:
{
  # Enable OpenSSH Daemon
  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = true;
    openFirewall = true;
  };
  programs.gnupg.agent = {
    enableSSHSupport = true;
  };
}
