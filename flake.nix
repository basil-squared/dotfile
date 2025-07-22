{
  description = "System Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    home-manager = {
    url = "github:nix-community/home-manager";
    inputs.nixpkgs.follows = "nixpkgs";
    };
    rose-pine-hyprcursor = {
      url = "github:ndom91/rose-pine-hyprcursor";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.hyprlang.follows = "hyprland/hyprlang";
    };
    hyprland.url = "github:hyprwm/hyprland?ref=v0.36.0";
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

