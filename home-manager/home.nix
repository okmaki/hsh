{ config, pkgs, ... }:
let
	username = "maki";
in
{
	imports = [
		./hyprland.nix
		./git.nix
	];

	home.stateVersion = "23.11";
	home.username = "${username}";
	home.homeDirectory = "/home/${username}";

	home.packages = with pkgs; [

		# misc desktop stuff
		swww

		# status bar + other widgets
		eww

		# notifications
		libnotify
		mako

		#fonts
		(nerdfonts.override { fonts = [ "Hack" "RobotoMono" "Agave" ]; })

		# tools
		imagemagick
		wl-clipboard
		bun
		ags
		ripgrep

		# terminal applications
		neofetch

		# desktop applications
		wezterm
		librewolf
		chromium
  	];

	programs.bash = {
		enable = true;
		enableCompletion = true;
		shellAliases = {
			vim = "nvim";
			config = "git --git-dir=$HOME/.config/";
		};
	};

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
		EDITOR = "nvim";
	};

	programs.home-manager.enable = true;
}
