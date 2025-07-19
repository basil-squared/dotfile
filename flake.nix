{
  description = "System Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    home-manager = {
    url = "github:nix-community/home-manager";
    inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, nix-flatpak, ... }: {
		nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";

			specialArgs = {inherit inputs;};
			modules = [
				nix-flatpak.nixosModules.nix-flatpak
				./nixos/configuration.nix
				./nixos/flatpak.nix
        ./home_mgr/cfgs
				{home-manager.users.juniperg = ./home_mgr/juniper.nix; }
			];
		};
	};
		

  }

