-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- How many lines of scrollback you want to retain per tab
config.scrollback_lines = 10000

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
--
local act = wezterm.action

config.keys = {
	-- To sroll up and down with keys
	{ key = "UpArrow", mods = "SHIFT", action = act.ScrollByLine(-1) },
	{ key = "DownArrow", mods = "SHIFT", action = act.ScrollByLine(1) },
	{ key = "LeftArrow", mods = "SHIFT", action = act.ScrollByLine(-20) },
	{ key = "RightArrow", mods = "SHIFT", action = act.ScrollByLine(20) },

	-- Use vim motion to change size panes with control shitf letter, notice that the debug console acces with control shift L was lost
	{ key = "LeftArrow", mods = "ALT", action = act.AdjustPaneSize({ "Left", 3 }) },
	{ key = "DownArrow", mods = "ALT", action = act.AdjustPaneSize({ "Down", 1 }) },
	{ key = "UpArrow", mods = "ALT", action = act.AdjustPaneSize({ "Up", 1 }) },
	{ key = "RightArrow", mods = "ALT", action = act.AdjustPaneSize({ "Right", 3 }) },

	-- To use vim motions to move between panes, with control shift
	{
		key = "H",
		mods = "CTRL",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "J",
		mods = "CTRL",
		action = act.ActivatePaneDirection("Down"),
	},
	{
		key = "K",
		mods = "CTRL",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		key = "L",
		mods = "CTRL",
		action = act.ActivatePaneDirection("Right"),
	},
}
-- config.leader = { key = 'a', mods = 'CTRL' }
-- config.keys = {
--   {
--     key = 'h',
--     mods = 'LEADER',
--     action = act.AdjustPaneSize { 'Left', 5 },
--   },
--   {
--     key = 'j',
--     mods = 'LEADER',
--     action = act.AdjustPaneSize { 'Down', 5 },
--   },
--   { key = 'k', mods = 'LEADER', action = act.AdjustPaneSize { 'Up', 5 } },
--   {
--     key = 'l',
--     mods = 'LEADER',
--     action = act.AdjustPaneSize { 'Right', 5 },
--   },
-- }

config.color_scheme = "Tokyo Night"
--config.color_scheme = 'Symfonic'
--config.color_scheme = 'Thayer Bright'
--config.color_scheme = 'ToyChest'
--config.color_scheme = 'AdventureTime'
--config.color_scheme = 'Atlas (base16)'
--config.color_scheme = 'Blue Matrix'
-- config.color_scheme = 'BlueDolphin'
-- config.color_scheme = 'Gogh (Gogh)'
-- config.window_background_image = '/home/daniel/Pictures/wallpaper/horizon-zero-dawn-2017-hd.jpg'
--config.font = wezterm.font 'JetBrains Mono'
-- config.font_dirs = { '/home/daniel/.local/share/fonts' }
-- config.font_locator = 'ConfigDirsOnly'
-- config.font = wezterm.font 'JetBrainsMono Nerd Font'

--[[
wezterm.on('update-right-status', function(window, pane)
  -- "Wed Mar 3 08:14"
  local date = wezterm.strftime '%a %b %-d %H:%M '

  window:set_right_status(wezterm.format {
    { Text = wezterm.nerdfonts.fa_clock_o .. ' ' .. date },
  })
end)


--[[
config.background = {
  -- This is the deepest/back-most layer. It will be rendered first
  {
    source = {
      File = '/home/daniel/Pictures/wallpaper/horizon-zero-dawn-2017-hd.jpg',
    },
    -- The texture tiles vertically but not horizontally.
    -- When we repeat it, mirror it so that it appears "more seamless".
    -- An alternative to this is to set `width = "100%"` and have
    -- it stretch across the display
    --repeat_x = 'Mirror',
    hsb = dimmer,
    --width = 'Contain',
    vertical_align = 'Middle',
    horizontal_align = 'Center'
    -- When the viewport scrolls, move this layer 10% of the number of
    -- pixels moved by the main viewport. This makes it appear to be
    -- further behind the text.
    -- attachment = { Parallax = 0.1 },
  },
  }

--config.window_decorations = "RESIZE"
--config.window_background_opacity = 0.1

config.window_background_gradient = {
  -- Can be "Vertical" or "Horizontal".  Specifies the direction
  -- in which the color gradient varies.  The default is "Horizontal",
  -- with the gradient going from left-to-right.
  -- Linear and Radial gradients are also supported; see the other
  -- examples below
  orientation = 'Vertical',

  -- Specifies the set of colors that are interpolated in the gradient.
  -- Accepts CSS style color specs, from named colors, through rgb
  -- strings and more
  colors = {
    '#1A1B26',
    '#1A1B26',
    '#1A1B26',
    --'#3a3a4f',    

    -- The texture tiles vertically but not horizontally.
    -- When we repeat it, mirror it so that it appears "more seamless".
    -- An alternative to this is to set `width = "100%"` and have
    -- it stretch across the d',
  },

  -- Instead of specifying `colors`, you can use one of a number of
  -- predefined, preset gradients.
  -- A list of presets is shown in a section below.
  -- preset = "Warm",

  -- Specifies the interpolation style to be used.
  -- "Linear", "Basis" and "CatmullRom" as supported.
  -- The default is "Linear".
  interpolation = 'Linear',

  -- How the colors are blended in the gradient.
  -- "Rgb", "LinearRgb", "Hsv" and "Oklab" are supported.
  -- The default is "Rgb".
  blend = 'Rgb',

  -- To avoid vertical color banding for horizontal gradients, the
  -- gradient position is randomly shifted by up to the `noise` value
  -- for each pixel.
  -- Smaller values, or 0, will make bands more prominent.
  -- The default value is 64 which gives decent looking results
  -- on a retina macbook pro display.
  -- noise = 64,

  -- By default, the gradient smoothly transitions between the colors.
  -- You can adjust the sharpness by specifying the segment_size and
  -- segment_smoothness parameters.
  -- segment_size configures how many segments are present.
  -- segment_smoothness is how hard the edge is; 0.0 is a hard edge,
  -- 1.0 is a soft edge.

  -- segment_size = 11,
  -- segment_smoothness = 0.0,
}
--]]
config.ssh_domains = {
	{
		-- This name identifies the domain
		name = "p6",
		-- The hostname or address to connect to. Will be used to match settings
		-- from your ssh config file
		remote_address = "172.21.6.205",
		-- The username to use on the remote host
		username = "dgonzalez",
		remote_wezterm_path = "/usr/local/bin/wezterm",
	},
	{
		-- This name identifies the domain
		name = "k80",
		-- The hostname or address to connect to. Will be used to match settings
		-- from your ssh config file
		remote_address = "172.21.6.185",
		-- The username to use on the remote host
		username = "dgonzalez",
		remote_wezterm_path = "/home/dgonzalez/bin/wezterm",
	},
}
config.unix_domains = {
	{
		name = "p6_wez",
		proxy_command = { "ssh", "-A", "-T", "-l", "dgonzalez", "p6", "wezterm", "cli", "jumper-siplab" },
	},
	{
		name = "k80_wez",
		proxy_command = { "ssh", "-T", "k80", "wezterm", "cli", "jumper-siplab" },
	},
}

config.font_size = 13.0
-- For 4k 28 inch 13,0 seems adquater, fro 1080 usually 10.0
-- local pattern = 'gst-launch-1\\.0\\s+[a-zA-Z0-9]+\\s+!'
-- local pattern_2 = [[\s+6]]
-- local pattern = [[gst-launch-1\.0(\s+[a-zA-Z0-9]+\s+!*)*]]
-- config.quick_select_patterns = {

--   pattern_2,
--   pattern
--   --'gst-launch-1\\.0(\\s+[a-zA-Z0-9]+\\s*!)*'

-- }

-- and finally, return the configuration to wezterm
return config
