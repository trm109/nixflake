{ lib, config, pkgs, ...}:
let
  cfg = config.modules.development;
in
{
  options.modules.development = {
    enable = lib.mkEnableOption "Enable Standard Development Software" // {
      default = true;
    };
  };
  config = lib.mkIf cfg.enable {
    virtualisation.docker.enable = true;

    environment.systemPackages = with pkgs; [
      # GUI
      insomnia
      ventoy-full
      gparted

      # Tools
      docker-compose
      awscli2
      android-tools

      # Libs needed for apps in general (for repo specific, use shell.nix)
      nodejs_21
      jdk17
      cmake
      python3
      rustup
      gcc
    ];
  };
}
