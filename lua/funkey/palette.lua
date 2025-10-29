local utils = require("funkey.utils")

-- Those define the primary colors of the theme. All other colors will be
-- derived from those.
local primary_colors = {
  -- Freely adjustable colors
  color_1 = "#B16AD2",
  color_2 = "#FEB13E",
  color_3 = "#55B849",
  background = "#1A071D",
  foreground = "#E8E5E3",
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
  color_1_dark = primary_colors.color_1 + lightness(-0.2),
  color_1_light = primary_colors.color_1 + lightness(0.2),
  color_2 = primary_colors.color_2,
  color_2_dark = primary_colors.color_2 + lightness(-0.2),
  color_2_light = primary_colors.color_2 + lightness(0.2),
  color_3 = primary_colors.color_3,
  color_3_dark = primary_colors.color_3 + lightness(-0.2),
  color_3_light = primary_colors.color_3 + lightness(0.2),
  -- a sequence of increasingly brighter background colors
  background_0 = primary_colors.background,
  background_1 = primary_colors.background + lightness(0.05),
  background_2 = primary_colors.background + lightness(0.10),
  background_3 = primary_colors.background + lightness(0.15),
  background_4 = primary_colors.background + lightness(0.20),
  -- a sequence of increasingly darker foreground colors
  foreground_0 = primary_colors.foreground,
  foreground_1 = primary_colors.foreground + lightness(-0.10),
  foreground_2 = primary_colors.foreground + lightness(-0.20),
  foreground_3 = primary_colors.foreground + lightness(-0.30),
  foreground_4 = primary_colors.foreground + lightness(-0.40),
  red = primary_colors.red,
  red_dark = primary_colors.red + lightness(-0.2),
  red_light = primary_colors.red + lightness(0.2),
  green = primary_colors.green,
  green_dark = primary_colors.green + lightness(-0.2),
  green_light = primary_colors.green + lightness(0.2),
  blue = primary_colors.blue,
  blue_dark = primary_colors.blue + lightness(-0.2),
  blue_light = primary_colors.blue + lightness(0.2),
}

-- Semantic colors.
local palette = {
  -- placeholder for future adjustments
  unassigned = "#ff11ee",
  -- normal text and highlights
  background = colors.background_0,
  background_1 = colors.background_1,
  background_2 = colors.background_2,
  background_3 = colors.background_3,
  background_4 = colors.background_4,
  text = colors.foreground_1,
  text_darker = colors.foreground_2,
  text_lighter = colors.foreground_0,
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
  variable = colors.foreground_1,
  parameter = colors.foreground_2,
  keyword = colors.color_1,
  type = colors.color_2,
  class = colors.color_2_light,
  constant = colors.color_3,
  operator = colors.foreground_3,
  comment = colors.foreground_4,
  -- no color?
  none = "NONE",
}

return palette
