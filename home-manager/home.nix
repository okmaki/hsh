{ config, pkgs, ... }:
let
	username = "maki";
in
{
	imports = [
		./shell.nix
		./git.nix
		./hyprland.nix
		./neofetch.nix
		./theme.nix
	];

	home.stateVersion = "23.11";
	home.username = "${username}";
	home.homeDirectory = "/home/${username}";

	home.packages = with pkgs; [

		# misc desktop stuff
		swww

		# notifications
		libnotify
		mako

		# tools
		imagemagick
		wl-clipboard
		bun
		ags
		ripgrep
		yazi
		starship

		# terminal applications
		neofetch

		# desktop applications
		wezterm
		librewolf
		chromium
  	];

	# Home Manager is pretty good at managing dotfiles. The primary way to manage
	# plain files is through 'home.file'.
	home.file = {
		# # Building this configuration will create a copy of 'dotfiles/screenrc' in
		# # the Nix store. Activating the configuration will then make '~/.screenrc' a
		# # symlink to the Nix store copy.
		# ".screenrc".source = dotfiles/screenrc;

		# # You can also set the file content immediately.
		# ".gradle/gradle.properties".text = ''
		#   org.gradle.console=verbose
		#   org.gradle.daemon.idletimeout=3600000
		# '';
	};

	# Home Manager can also manage your environment variables through
	# 'home.sessionVariables'. If you don't want to manage your shell through Home
	# Manager then you have to manually source 'hm-session-vars.sh' located at
	# either # #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh # # or #
	#  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
	#
	# or
	#
	#  /etc/profiles/per-user/maki/etc/profile.d/hm-session-vars.sh
	#
	home.sessionVariables = {
		SHELL = "${pkgs.nushell}/bin/nu";	
		EDITOR = "nvim";
		VISUAL = "nvim";
	};

	programs.home-manager.enable = true;
}
