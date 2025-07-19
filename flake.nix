{
  description = "System Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
    url = "github:nix-community/home-manager";
    inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }: {
		nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";

			specialArgs = {inherit inputs;};
			modules = [
				./nixos/configuration.nix
				{home-manager.users.juniperg = ./home_mgr/juniper.nix; }
			];
		};
	};
		

  }

