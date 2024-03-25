
{
  description = "Your new nix config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    # You can access packages and modules from different nixpkgs revs
    # at the same time. Here's an working example:
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    # Also see the 'unstable-packages' overlay at 'overlays/default.nix'.

    # Home manager
    home-manager.url = "github:nix-community/home-manager/release-23.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # TODO: Add any other flake you might need
    # hardware.url = "github:nixos/nixos-hardware";

    # Shameless plug: looking for a way to nixify your themes and make
    # everything match nicely? Try nix-colors!
    # nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = { 
    self, 
    nixpkgs, 
    home-manager, 
    ...
  } @ inputs: let
    inherit (self) outputs;
    # Supported Systems
    systems = [
      #"aarch64-linux"
      #"i686-linux"
      "x86_64-linux"
      #"aarch64-darwin"
      #"x86_64-darwin"
    ];
    # This is a function that generates an attribute by calling a function you
    # pass to it, with each system as an argument
    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {
    # Custom Packages
    packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
    
    # Formatter for your nix files, available through 'nix fmt'
    # Other options beside 'alejandra' include 'nixpkgs-fmt'
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

    # Your custom packages and modifications, exported as overlays
    #overlays = import ./modules/overlays {inherit inputs;};

    # Reusable nixos modules you might want to export
    # These are usually stuff you would upstream into nixpkgs
    nixosModules = import ./modules;



    #configurations
    nixosConfigurations = {
      mac-mini = nixpkgs.lib.nixosSystem {
	system = "x86_64-linux";  
	specialArgs = {
	  username = "saik";
	  hostname = "mac-mini";
	  hostType = "server";
	  inherit inputs outputs;
	};
	modules = [
	  ./nixos
	];
      }; # mac mini

      asus-flow = nixpkgs.lib.nixosSystem {
	system = "x86_64-linux";  
	specialArgs = {
	  username = "saik";
	  hostname = "asus-flow";
	  hostType = "desktop";
	  inherit inputs outputs;
	};
	modules = [
	  ./nixos
	];
      }; # asus flow

      optipleximus-prime = nixpkgs.lib.nixosSystem {
	system = "x86_64-linux";
	specialArgs = {
	  username = "saik";
	  hostname = "optipleximus-prime";
	  hostType = "server";
	  inherit inputs outputs;
	};
	modules = [
	  ./nixos
	];
      }; # optipleximus-prime

      think-centre = nixpkgs.lib.nixosSystem {
	system = "x86_64-linux";
	specialArgs = {
	  username = "saik";
	  hostname = "think-centre";
	  hostType = "server";
	  inherit inputs outputs;
	};
	modules = [
	  ./nixos
	];
      }; # think-centre

    };
  };
}
