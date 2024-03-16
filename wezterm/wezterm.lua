-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration
local config = wezterm.config_builder()

config.color_scheme = 'PaperColor Dark (base16)'

config.font = wezterm.font 'Hack Nerd Font Mono'

local act = wezterm.action

config.keys = {
	{
		key = 't',
		mods = 'CTRL',
		action = act.SpawnTab 'CurrentPaneDomain',
	},
	{
		key = 'w',
		mods = 'CTRL',
		action = act.CloseCurrentTab { confirm = false },
	},
}

for i = 1, 8 do
		table.insert(
			config.keys,
			{
				key = tostring(i),
				mods = 'ALT',
				action = act.ActivateTab(i - 1),
			})
end

return config
