local wezterm = require("wezterm")
local act = wezterm.action
local colors = {
	kanagawa = {
		foreground = "#dcd7ba",
		background = "#1f1f28",

		cursor_bg = "#c8c093",
		cursor_fg = "#c8c093",
		cursor_border = "#c8c093",

		selection_fg = "#c8c093",
		selection_bg = "#2d4f67",

		scrollbar_thumb = "#16161d",
		split = "#16161d",

		ansi = { "#090618", "#c34043", "#76946a", "#c0a36e", "#7e9cd8", "#957fb8", "#6a9589", "#c8c093" },
		brights = { "#727169", "#e82424", "#98bb6c", "#e6c384", "#7fb4ca", "#938aa9", "#7aa89f", "#dcd7ba" },
		indexed = { [16] = "#ffa066", [17] = "#ff5d62" },
	},
}

return {
	font = wezterm.font("Hack Nerd Font", { weight = "Regular" }),
	font_size = 16,
	window_padding = { left = 4, right = 4, top = 4, bottom = 4 },
	enable_tab_bar = false,
	use_fancy_tab_bar = false,
	force_reverse_video_cursor = true,
	colors = colors.kanagawa,
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
