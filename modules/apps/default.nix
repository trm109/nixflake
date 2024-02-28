# modules/apps/default.nix
{ ... }:
{
  # Default Applications here.
  imports = [
    ./art
    ./browser
    ./file_explorer
    ./fun
    ./virtualisation
    ./work
  ];
}
