{
  description = "Saik's NixOS Flake.";

  inputs = {
    # Grab nixpkgs reference.
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    # Grab home manager.
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Agenix?
    
    # Hyprland
    hyprland = {
      url = "github:hyprwm/hyprland";
    };
  };
  
  outputs = { self, nixpkgs, ...} @ attrs:
    let
      supportedSystems = [ "x86_64-linux" ];
      forAllSystems = nixpkgs.lib.genattrs supportedSystems;
      nixpkgsFor = forAllSystems (system: import nixpkgs { inherit system; });
    in
    {
      nixosConfigurations = {
	mac-mini = 
	  let
	    system = "x86_64-linux";  
	  in nixpkgs.lib.nixosSystem {
	    specialArgs = {
	      username = "saik";
	      hostname = "mac-mini";
	      hyprlandConfig = "desktop";
	      #nvidia = false;
	      #wayland = true;
	      #gamingHost = true;
	      inherit system;
	    } // attrs;
	    
	    modules = [
	      ./.
	      ./modules/hyprland
	      ./modules/apps
	      ./modules/apps/fun
	    ];
	  }; # mac mini
	
	asus-flow = 
	  let
	    system = "x86_64-linux";  
	  in nixpkgs.lib.nixosSystem {
	    specialArgs = {
	      username = "saik";
	      hostname = "asus-flow";
	      hyprlandConfig = "desktop";
	      inherit system;
	    } // attrs;

	    modules = [
	      ./.
	      ./modules/apps
	      ./modules/apps/fun
	      ./modules/apps/fun/steam

	      ./modules/hyprland

	      ./modules/development
	      
	      ./modules/hardware/asus
	      ./modules/hardware/nvidia
	      ./modules/hardware/printer
	    ];
	  }; # asus flow
      };

      devShells = forAllSystems (system:
        let
          pkgs = nixpkgsFor.${system};
        in
        {
          default = pkgs.mkShell {
            buildInputs = with pkgs; [
              git
              nixpkgs-fmt
              statix
            ];
          };
        });
      
      templates.default = {
	path = ./.;
	description = "Default tempalte for Saik's flakes.";
      };

      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;
    };
}
