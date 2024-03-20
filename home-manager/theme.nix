{ pkgs, ... }:
let
	nerdfonts = (pkgs.nerdfonts.override { fonts = [
		"Hack"
		"FiraCode"
	]; });
	font = {
		name = "Hack Nerd Font";
		package = nerdfonts;
	};
in
{
	home = {
		packages = with pkgs; [
			font.package
		];
	};
}
