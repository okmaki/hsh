{ inputs, pkgs, lib, ... }: {
	wayland.windowManager.hyprland =
	{
		enable = true;
		systemd.enable = true;
	};

	wayland.windowManager.hyprland.extraConfig = let
		binding = mod: cmd: key: arg: "${mod},${key},${cmd},${arg}";
		movefocus = binding "$mod" "movefocus";
		swapwindow = binding "$mod+SHIFT" "swapwindow";
		resizeactive = binding "$mod+ALT" "resizeactive";
		workspaces = [ 1 2 3 4 5 ];
		workspace = binding "$mod" "workspace";
		movetoworkspace = binding "$mod+SHIFT" "movetoworkspace";
		movetoworkspacesilent = binding "$mod+ALT" "movetoworkspacesilent";
		wallpapers = [ 1 2 3 4 5 6 7 8 9 ];
		setwallpaper = binding "" "exec";
		nl = "\n\t\t";
	in ''
		general {
			border_size=1
			col.active_border=rgba(00000044)
			col.inactive_border=rgba(00000044)
			gaps_in=32
			gaps_out=32
			layout=master
		}

		decoration {
			rounding=8
			active_opacity=0.900000
			inactive_opacity=0.600000
			drop_shadow=yes
			shadow_range=8
			shadow_render_power=2
			col.shadow=rgba(00000044)
			blur {
				enabled=true
				popups=true
				passes=3
				new_optimizations=on
				brightness=0.800000
				contrast=0.900000
				noise=0.010000
			}
		}

		input {
			kb_layout=us
		}

		$mod=SUPER

		bind=$mod+ALT,Q,exit,
		bind=$mod,W,killactive,
		bind=$mod,T,exec,wezterm
		bind=$mod,B,exec,librewolf
		bind=$mod+ALT,B,exec,chromium
		bind=${movefocus "h" "l"}
		bind=${movefocus "j" "d"}
		bind=${movefocus "k" "u"}
		bind=${movefocus "l" "r"}
		bind=${swapwindow "h" "l"}
		bind=${swapwindow "j" "d"}
		bind=${swapwindow "k" "u"}
		bind=${swapwindow "l" "r"}
		bind=${resizeactive "h" "-20 0"}
		bind=${resizeactive "j" "0 20"}
		bind=${resizeactive "k" "0 -20"}
		bind=${resizeactive "l" "20 0"}
		${lib.strings.concatMapStringsSep nl (i: "bind=" + (workspace (toString i) (toString i))) workspaces}
		${lib.strings.concatMapStringsSep nl (i: "bind=" + (movetoworkspacesilent (toString i) (toString i))) workspaces}

		# wallpaper submap
		bind=$mod+SHIFT,P,submap,wallpaper
		submap=wallpaper
		${lib.strings.concatMapStringsSep nl (i: "bind=" + (setwallpaper (toString i) "swww img ~/.config/wallpapers/wp${toString i}.jpg")) wallpapers}
		bind=,escape,submap,reset
		submap=reset

		exec-once=mako
		exec-once=wl-paste -t text --watch clipman store -P --histpath="~/.local/share/clipman-primary.json"
		exec-once=swww init && swww img ./config/wallpapers/wp1.jpg
	'';
}
