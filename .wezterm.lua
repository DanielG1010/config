-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
--config.color_scheme = 'Tokyo Night'
config.color_scheme = 'Symfonic'
--config.color_scheme = 'Thayer Bright'
--config.color_scheme = 'ToyChest'

-- config.window_background_image = '/home/daniel/Pictures/wallpaper/horizon-zero-dawn-2017-hd.jpg'


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
--]]
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
    '#212130',
    '#264653',
    '#212130',
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

-- and finally, return the configuration to wezterm
return config
