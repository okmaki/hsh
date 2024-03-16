{ pkgs, ...}:
let
	name = "maki";
	email = "makidotnet@gmail.com";
	username = "okmaki";
in
{
	programs.git.enable = true;
	programs.git.userName = name;
	programs.git.userEmail = email;

	programs.git.extraConfig = {
		color.ui = true;
		core.editor = "nvim";
		credential.helper = "store";
		github.user = username;
	};
}
