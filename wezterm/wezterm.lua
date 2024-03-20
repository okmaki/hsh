-- Pull in the wezterm API
local wezterm = require('wezterm')

-- This will hold the configuration
local config = wezterm.config_builder()
config.default_prog = { 'nu' }

------------------------------------------------------------
-- THEME
------------------------------------------------------------

config.color_scheme = 'PaperColor Dark (base16)'
-- config.color_scheme = 'Catppuccin Mocha' -- or Macchiato, Frappe, Latte

config.font = wezterm.font 'Hack Nerd Font Mono'

------------------------------------------------------------
-- SETTINGS
------------------------------------------------------------

config.enable_tab_bar = false
config.window_padding = {
	left = 16,
	right = 16,
	top = 16,
	bottom = 16,
}

------------------------------------------------------------
-- KEYS
------------------------------------------------------------

local act = wezterm.action

config.keys = {
	{
		key = 't',
		mods = 'CTRL',
		action = act.SpawnTab('CurrentPaneDomain'),
	},
	{
		key = 'w',
		mods = 'CTRL',
		action = act.CloseCurrentTab({ confirm = false }),
	},
	{
		key = 'p',
		mods = 'CTRL',
		action = act.PasteFrom('Clipboard'),
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
