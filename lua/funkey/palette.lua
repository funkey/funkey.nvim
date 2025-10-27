local config = require("funkey.config")
local utils = require("funkey.utils")

-- Those define the primary colors of the theme. All other colors will be
-- derived from those.
local primary_colors = {
  -- Freely adjustable colors
  color_1 = "#B16AD2",
  color_2 = "#DD8C13",
  color_3 = "#55B849",
  -- background = "#110106",  -- my slides background
  background = "#1A071D",  -- a pleasant compromise
  -- background = "#250A29",  -- my terminal background
  foreground = "#E0CFE3",
  -- Specific colors (for git diffs and errors)
  red = "#E64505",
  green = "#55B849",
  blue = "#0B7FF4",
}

-- Mixin to change the lightness of a color.
local function lightness(value)
  return setmetatable({}, {
    __add = function(a)
      return utils.color_lightness(a, value)
    end,
  })
end

-- All theme colors, derived from the primary colors only.
local colors = {
  color_1 = primary_colors.color_1,
  color_1_dark = primary_colors.color_1 + lightness(-0.3),
  color_1_light = primary_colors.color_1 + lightness(0.2),
  color_2 = primary_colors.color_2,
  color_2_dark = primary_colors.color_2 + lightness(-0.2),
  color_2_light = primary_colors.color_2 + lightness(0.4),
  color_3 = primary_colors.color_3,
  color_3_dark = primary_colors.color_3 + lightness(-0.4),
  color_3_light = primary_colors.color_3 + lightness(0.4),
  grayscale_0 = primary_colors.background,
  grayscale_10 = utils.interpolate(primary_colors.background, primary_colors.foreground, 0.10),
  grayscale_25 = utils.interpolate(primary_colors.background, primary_colors.foreground, 0.25),
  grayscale_30 = utils.interpolate(primary_colors.background, primary_colors.foreground, 0.30),
  grayscale_40 = utils.interpolate(primary_colors.background, primary_colors.foreground, 0.40),
  grayscale_50 = utils.interpolate(primary_colors.background, primary_colors.foreground, 0.50),
  grayscale_75 = utils.interpolate(primary_colors.background, primary_colors.foreground, 0.75),
  grayscale_100 = primary_colors.foreground,
  red = primary_colors.red,
  red_dark = primary_colors.red + lightness(-0.3),
  red_light = primary_colors.red + lightness(0.3),
  green = primary_colors.green,
  green_dark = primary_colors.green + lightness(-0.3),
  green_light = primary_colors.green + lightness(0.3),
  blue = primary_colors.blue,
  blue_dark = primary_colors.blue + lightness(-0.3),
  blue_light = primary_colors.blue + lightness(0.3),
}

-- Semantic colors.
local palette = {
  -- placeholder for future adjustments
  unassigned = "#ff11ee",
  -- normal text and highlights
  background = colors.grayscale_0,
  background_1 = colors.grayscale_10,
  background_2 = colors.grayscale_25,
  background_3 = colors.grayscale_30,
  background_4 = colors.grayscale_40,
  text = colors.grayscale_75,
  text_darker = colors.grayscale_50,
  text_lighter = colors.grayscale_100,
  highlight = colors.color_2,
  highlight_secondary = colors.color_2_light,
  -- diffs (also for git)
  diff_delete = colors.red_dark,
  diff_add = colors.green_dark,
  diff_change = colors.blue_dark,
  -- annotations
  error = colors.red_dark,
  warning = colors.green_dark,
  hint = colors.green_dark,
  info = colors.green_dark,
  debug = colors.green_dark,
  -- UI
  title = colors.color_3,
  button = colors.color_3,
  directory = colors.color_3,
  -- syntax highlights
  variable = colors.grayscale_75,
  parameter = colors.grayscale_100,
  keyword = colors.color_1,
  type = colors.color_2,
  class = colors.color_2_light,
  constant = colors.color_3,
  operator = colors.grayscale_50,
  comment = colors.grayscale_50,
  -- no color?
  none = "NONE",
}

return palette
