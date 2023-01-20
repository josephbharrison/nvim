local wezterm = require("wezterm")
local act = wezterm.action

local colors = {
	fujiWhite = {
		rgb = "#DCD7BA",
		desc = "Default foreground",
	},
	oldWhite = {
		rgb = "#C8C093",
		desc = "Dark foreground (statuslines)",
	},
	inkBlack = {
		rgb = "#090618",
		desc = "black",
	},
	sumiInk0 = {
		rgb = "#16161D",
		desc = "Dark background (statuslines and floating windows)",
	},
	sumiInk1 = {
		rgb = "#1F1F28",
		desc = "Default background",
	},
	sumiInk2 = {
		rgb = "#2A2A37",
		desc = "Lighter background (colorcolumn, folds)",
	},
	sumiInk3 = {
		rgb = "#363646",
		desc = "Lighter background (cursorline)",
	},
	sumiInk4 = {
		rgb = "#54546D",
		desc = "Darker foreground (line numbers, fold column, non-text chars), float borders",
	},
	waveBlue1 = {
		rgb = "#223249",
		desc = "Popup background, visual selection background",
	},
	waveBlue2 = {
		rgb = "#2D4F67",
		desc = "Popup selection background, search background",
	},
	winterGreen = {
		rgb = "#2B3328",
		desc = "Diff Add (background)",
	},
	winterYellow = {
		rgb = "#49443C",
		desc = "Diff Change (background)",
	},
	winterRed = {
		rgb = "#43242B",
		desc = "Diff Deleted (background)",
	},
	winterBlue = {
		rgb = "#252535",
		desc = "Diff Line (background)",
	},
	autumnGreen = {
		rgb = "#76946A",
		desc = "Git Add",
	},
	autumnRed = {
		rgb = "#C34043",
		desc = "Git Delete",
	},
	autumnYellow = {
		rgb = "#DCA561",
		desc = "Git Change",
	},
	samuraiRed = {
		rgb = "#E82424",
		desc = "Diagnostic Error",
	},
	roninYellow = {
		rgb = "#FF9E3B",
		desc = "Diagnostic Warning",
	},
	waveAqua1 = {
		rgb = "#6A9589",
		desc = "Diagnostic Info",
	},
	dragonBlue = {
		rgb = "#658594",
		desc = "Diagnostic Hint",
	},
	fujiGray = {
		rgb = "#727169",
		desc = "Comments",
	},
	springViolet1 = {
		rgb = "#938AA9",
		desc = "Light foreground",
	},
	oniViolet = {
		rgb = "#957FB8",
		desc = "Statements and Keywords",
	},
	crystalBlue = {
		rgb = "#7E9CD8",
		desc = "Functions and Titles",
	},
	springViolet2 = {
		rgb = "#9CABCA",
		desc = "Brackets and punctuation",
	},
	springBlue = {
		rgb = "#7FB4CA",
		desc = "Specials and builtin functions",
	},
	lightBlue = {
		rgb = "#A3D4D5",
		desc = "Not used",
	},
	waveAqua2 = {
		rgb = "#7AA89F",
		desc = "Types",
	},
	springGreen = {
		rgb = "#98BB6C",
		desc = "Strings",
	},
	boatYellow1 = {
		rgb = "#938056",
		desc = "Not used",
	},
	boatYellow2 = {
		rgb = "#C0A36E",
		desc = "Operators, RegEx",
	},
	carpYellow = {
		rgb = "#E6C384",
		desc = "Identifiers",
	},
	sakuraPink = {
		rgb = "#D27E99",
		desc = "Numbers",
	},
	waveRed = {
		rgb = "#E46876",
		desc = "Standout specials 1 (builtin variables)",
	},
	peachRed = {
		rgb = "#FF5D62",
		desc = "Standout specials 2 (exception handling, return)",
	},
	surimiOrange = {
		rgb = "#FFA066",
		desc = "Constants, imports, booleans",
	},
	katanaGray = {
		rgb = "#717C7C",
		desc = "Deprecated",
	},
}

local color = function(c)
	return string.lower(colors[c].rgb)
end

local icolor = function(i)
	local index = 0
	for k, _ in pairs(colors) do
		if index == i then
			return color(k)
		end
		index = index + 1
	end
end

local colorschemes = {
	kanagawa = {
		foreground = color("fujiWhite"),
		background = color("sumiInk1"),

		cursor_bg = color("oldWhite"),
		cursor_fg = color("oldWhite"),
		cursor_border = color("oldWhite"),

		selection_fg = color("oldWhite"),
		selection_bg = color("waveBlue2"),

		scrollbar_thumb = color("sumiInk0"),
		split = color("sumiInk0"),

		ansi = {
			color("inkBlack"),
			color("autumnRed"),
			color("autumnGreen"),
			color("boatYellow2"),
			color("crystalBlue"),
			color("springViolet1"),
			color("waveAqua1"),
			color("oldWhite"),
		},

		brights = {
			color("fujiGray"),
			color("samuraiRed"),
			color("springGreen"),
			color("carpYellow"),
			color("springBlue"),
			color("oniViolet"),
			color("waveAqua2"),
			color("fujiWhite"),
		},

		indexed = {
			[16] = color("fujiWhite"), --     #DCD7BA
			[17] = color("oldWhite"), --      #C8C093
			[18] = color("inkBlack"), --      #090618
			[19] = color("sumiInk0"), --      #16161D
			[20] = color("sumiInk1"), --      #1F1F28
			[21] = color("sumiInk2"), --      #2A2A37
			[22] = color("sumiInk3"), --      #363646
			[23] = color("sumiInk4"), --      #54546D
			[24] = color("waveBlue1"), --     #223249
			[25] = color("waveBlue2"), --     #2D4F67
			[26] = color("winterGreen"), --   #2B3328
			[27] = color("winterYellow"), --  #49443C
			[28] = color("winterRed"), --     #43242B
			[29] = color("winterBlue"), --    #252535
			[30] = color("autumnGreen"), --   #76946A
			[31] = color("autumnRed"), --     #C34043
			[32] = color("autumnYellow"), --  #DCA561
			[33] = color("samuraiRed"), --    #E82424
			[34] = color("roninYellow"), --   #FF9E3B
			[35] = color("waveAqua1"), --     #6A9589
			[36] = color("dragonBlue"), --    #658594
			[37] = color("fujiGray"), --      #727169
			[38] = color("springViolet1"), -- #938AA9
			[39] = color("oniViolet"), --     #957FB8
			[40] = color("crystalBlue"), --   #7E9CD8
			[41] = color("springViolet2"), -- #9CABCA
			[42] = color("springBlue"), --    #7FB4CA
			[43] = color("lightBlue"), --     #A3D4D5
			[44] = color("waveAqua2"), --     #7AA89F
			[45] = color("springGreen"), --   #98BB6C
			[46] = color("boatYellow1"), --   #938056
			[47] = color("boatYellow2"), --   #C0A36E
			[48] = color("carpYellow"), --    #C0A36E
			[49] = color("sakuraPink"), --    #D27E99
			[50] = color("waveRed"), --       #E46876
			[51] = color("peachRed"), --      #FF5D62
			[52] = color("surimiOrange"), --  #FFA066
			[53] = color("katanaGray"), --    #717C7C
		},
	},
}

return {
	font = wezterm.font("Hack Nerd Font", { weight = "Regular" }),
	font_size = 20,
	window_padding = { left = 4, right = 4, top = 4, bottom = 0 },
	enable_tab_bar = false,
	use_fancy_tab_bar = false,
	force_reverse_video_cursor = true,
	colors = colorschemes.kanagawa,
	scrollback_lines = 5000,
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
