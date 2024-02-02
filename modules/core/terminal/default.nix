{ pkgs, home-manager, username, ... }:
{
  imports = [
    ./fish
    ./fonts
    ./kitty
    ./nvim
  ];

  # Home Configuration
  home-manager.users.${username} = {
    #programs.git.enable = true;
    programs.vim.enable = true;
  };  
  
  # System-Wide Configurations
  programs = {
    mtr.enable = true;
    fish.enable = true;
  };

  # Default packages related to terminal
  environment.systemPackages = with pkgs; [
    btop
    neofetch
    nitch
    tree
    wget
    curl
    zip
    unzip
    jq
    neovim
    gh
    bat
    tre-command
  ];
}
