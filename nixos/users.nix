{ ... }:
{
	users.users.maki = {
		initialPassword = "password";
		isNormalUser = true;
		extraGroups = [ "wheel" ];
	};
}
