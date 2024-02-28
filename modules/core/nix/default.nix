{ home-manager, pkgs, username, ... }:
{
  # https://github.com/lovesegfault/nix-config/blob/e412cd01cda084c7e3f5c1fbcf7d99665999949e/core/nixos.nix#L39
  system = {
    extraSystemBuilderCmds = ''
      ln -sv ${pkgs.path} $out/nixpkgs
    '';
    stateVersion = "23.11";
  };

  # Enable Flakes and nix-commands, enable removing channels
  nix = {
    nixPath = [ "nixpkgs=/run/current-system/nixpkgs" ];
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  home-manager.users.${username} = {
    /* The home.stateVersion option does not have a default and must be set */
    home.stateVersion = "23.11";
    nixpkgs.config.allowUnfree = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  # Allow electron
  nixpkgs.config.permittedInsecurePackages = [
    "electron-19.1.9"
  ];

  # Automatically perform nix garbage collection
  nix.gc.automatic = true;
  # Automatically deduplicate nix store
  nix.settings.auto-optimise-store = true;
}
