# modules/apps/default.nix
{ ... }:
{
  # Default Applications here.
  imports = [
    ./browser
    ./file_explorer
    ./art
    ./fun
    ./work
    ./virtualisation
  ];
}
