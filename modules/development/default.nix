{pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    # GUI
    insomnia
    etcher
    ventoy-full
    gparted

    # Tools
    docker-compose
    awscli2
    android-tools

    # Libs needed for apps in general (for repo specific, use shell.nix)
    nodesjs_21
    jdk17
    cmake
    python3
    rustup
    gcc
  ];
}
