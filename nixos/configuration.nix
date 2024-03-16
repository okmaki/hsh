{ config, lib, pkgs, ... }:
{
	imports = [
		./hardware-configuration.nix
		./locale.nix
		./networking.nix
		./audio.nix
		./users.nix
	];

	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;
	boot.loader.grub.device = "nodev";

	xdg.portal.enable = true;
	xdg.portal.extraPortals = [
		pkgs.xdg-desktop-portal-hyprland
	];

	environment.systemPackages = with pkgs; [
		vim
		wget
		home-manager
		hwinfo
	];

	# Copy the NixOS configuration file and link it from the resulting system
	# (/run/current-system/configuration.nix). This is useful in case you
	# accidentally delete configuration.nix.
	# system.copySystemConfiguration = true;

	system.stateVersion = "23.11"; # no touchy! >:^(
}
