{pkgs, username, ...}:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.saik = {
    shell = pkgs.fish;
    isNormalUser = true;
    description = "saik";
    extraGroups = [ "networkmanager" "wheel" "input" "audio" "video" "render" "docker" "libvirtd" "vboxusers" ];
    packages = with pkgs; [
    ];
  };
  home-manager.users.${username}.home.packages = with pkgs; [
    gitAndTools.gh
    git-lfs
    git
  ];
  #home-manager.users.${username} = {
  #  # setting git.
  #  programs.git = {
  #    enable = true;
  #    userName = "trm109";
  #    userEmail = "trm109@case.edu";
  #  };
  #};
}
