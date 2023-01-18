local wezterm = require("wezterm")
local act = wezterm.action

return {
	font = wezterm.font("Hack Nerd Font Mono", { weight = "Regular" }),
	font_size = 16,
	color_scheme = "tokyonight",
	window_padding = { left = 4, right = 4, top = 4, bottom = 4 },
	enable_tab_bar = false,
	use_fancy_tab_bar = false,
	keys = {
		{
			key = "d",
			mods = "CMD",
			action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "D",
			mods = "CMD",
			action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "RightArrow",
			mods = "CMD",
			action = act.ActivatePaneDirection("Right"),
		},
		{
			key = "LeftArrow",
			mods = "CMD",
			action = act.ActivatePaneDirection("Left"),
		},
		{
			key = "UpArrow",
			mods = "CMD",
			action = act.ActivatePaneDirection("Up"),
		},
		{
			key = "DownArrow",
			mods = "CMD",
			action = act.ActivatePaneDirection("Down"),
		},
		{
			key = "]",
			mods = "CMD",
			action = act.ActivatePaneDirection("Next"),
		},
		{
			key = "[",
			mods = "CMD",
			action = act.ActivatePaneDirection("Next"),
		},
		{
			key = "w",
			mods = "CMD",
			action = wezterm.action.CloseCurrentPane({ confirm = false }),
		},
		{
			key = "Enter",
			mods = "CMD|SHIFT",
			action = wezterm.action.TogglePaneZoomState,
		},
		{
			key = "f",
			mods = "CMD|CTRL",
			action = wezterm.action.ToggleFullScreen,
		},
	},
}
