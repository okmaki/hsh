{ pkgs, ... }:
let
	tabsize = "3";
in
{
	programs.neovim = {
		enable = true;
		viAlias = true;
		vimAlias = true;
	};

	programs.neovim.plugins = [

	];

	programs.neovim.extraConfig = ''
		set tabstop=${tabsize}
		set softtabstop=0 noexpandtab
		set shiftwidth=${tabsize}
	'';

}
