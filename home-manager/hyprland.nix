{ inputs, pkgs, ... }:
{
	wayland.windowManager.hyprland =
	{
		enable = true;
		systemd.enable = true;
	};

	wayland.windowManager.hyprland.settings =
	{
		exec-once = [
			"exec mako"
			"exec exec eww daemon && eww open bar"
		];

		general = {
			layout = "master";

			# border
			border_size = 1;
			"col.inactive_border" = "rgba(00000044)";
			"col.active_border" = "rgba(00000044)";

			# gaps
			gaps_in = 20;
			gaps_out = 20;

		};

		input = {
			kb_layout = "us";
		};

		"$mod" = "SUPER";

		bind = let
			binding = mod: cmd: key: arg: "${mod}, ${key}, ${cmd}, ${arg}";
			movefocus = binding "$mod" "movefocus";
			moveactive = binding "$mod + CTRL" "swapwindow";
			resizeactive = binding "$mod + ALT" "resizeactive";
			workspace = binding "$mod" "workspace";
			workspaces = [1 2 3 4 5];
		in [
			"$mod + ALT, Q, exit, "
			"$mod, R, exec, eww open --toggle launcher"
			"$mod + SHIFT, R, exec, tofi-drun --drun-launch=true"
			"$mod, W, killactive, "
			"$mod, T, exec, wezterm"
			(movefocus "h" "l")
			(movefocus "j" "d")
			(movefocus "k" "u")
			(movefocus "l" "r")
			(moveactive "h" "l")
			(moveactive "j" "d")
			(moveactive "k" "u")
			(moveactive "l" "r")
			(resizeactive "h" "-20 0")
			(resizeactive "j" "0 20")
			(resizeactive "k" "0 -20")
			(resizeactive "l" "20 0")
		]
		++ (map (i: workspace (toString i) (toString i)) workspaces);

		decoration = {
			rounding = 8;
			active_opacity = 0.9;
			inactive_opacity = 0.6;

			# shadow
			drop_shadow = "yes";
			shadow_range = 8;
			shadow_render_power = 2;
			"col.shadow" = "rgba(00000044)";

			#blur
			blur = {
				enabled = true;
				size = 8;
				passes = 3;
				new_optimizations = "on";
				noise = 0.01;
				contrast = 0.9;
				brightness = 0.8;
				popups = true;
			};
		};
	};
}
