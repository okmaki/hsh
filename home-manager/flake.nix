{
	description = "Home Manager configuration of maki";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { nixpkgs, home-manager, ... }:
	let
		system = "x86_64-linux";
		pkgs = nixpkgs.legacyPackages.${system};
		username = "maki";
	in
	{
		homeConfigurations."${username}" = home-manager.lib.homeManagerConfiguration
		{
			inherit pkgs;
			modules = [ ./home.nix ];

		};
	};
}
