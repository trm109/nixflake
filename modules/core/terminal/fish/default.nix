{ pkgs, home-manager, username, ... }:
{
  programs.fish = {
    interactiveShellInit = ''
      nitch
    '';
    shellAliases = {
      upd = "sudo nixos-rebuild switch --flake .";
      gitac = "git add -A && git commit -m $ARGV";
    };
  };
}
