{ config, pkgs, ... }:
{
	imports = [
		./hyprland.nix
		./launcher.nix
		./neovim.nix
		./git.nix
	];

	home.stateVersion = "23.11";
	home.username = "maki";
	home.homeDirectory = "/home/maki";

	home.packages = with pkgs; [

		# status bar + other widgets
		eww

		# launcher
		tofi

		# notifications
		libnotify
		mako

		#fonts
		(nerdfonts.override { fonts = [ "Hack" "RobotoMono" "Agave" ]; })

		# tools

		# terminal applications
		neofetch

		# desktop applications
		wezterm
		librewolf
		chromium
  	];

	home.shellAliases = {
		config = "git --git-dir=$HOME/.config/
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
