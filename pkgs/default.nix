{
  self,
  pkgs,
  ...
}: let
  sources = pkgs.callPackage ./sources.nix {};
  callPackage = pkgs.lib.callPackageWith (pkgs // {inherit self sources;});
in {
  ryzen_smu = callPackage ./applications/ryzen_adj.nix {};
}

