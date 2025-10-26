local config = require("funkey.config")
local utils = require("funkey.utils")

local colors = {
    funkey_color_1 = "#B16AD2",
    funkey_color_1_dark = "#3F1B50",
    funkey_color_1_light = "#C289DC",
    funkey_color_2 = "#DD8C13",
    funkey_color_2_dark = "#50350B",
    funkey_color_2_light = "#F4C071",
    funkey_color_3 = "#55B849",
    funkey_color_3_dark = "#295C24",
    funkey_color_3_light = "#98D491",
    funkey_color_4 = "#DB8457",
    funkey_color_5 = "#8174B1",
    funkey_color_6 = "#ADD8E6",
    funkey_color_7 = "#000080",
    funkey_color_8 = "#800020",
    funkey_color_9 = "#228B22",
    funkey_grayscale_0 = "#250A29",
    funkey_grayscale_25 = "#372D39",
    funkey_grayscale_50 = "#808080",
    funkey_grayscale_75 = "#D0C7D1",
    funkey_grayscale_100 = "#E0CFE3",
}

local function gamma(value)
    return setmetatable({}, {
        __add = function(a)
            return utils.color_gamma(a, value)
        end,
    })
end

local palette = {
    -- placeholder for future adjustments
    replaceme = "#ff11ee",
    -- foreground
    text = colors.funkey_grayscale_75,
    text_darker = colors.funkey_grayscale_50,
    text_lighter = colors.funkey_grayscale_100,
    highlight = colors.funkey_color_2,
    highlight_secondary = colors.funkey_color_2_light,
    -- background
    bg0 = colors.funkey_grayscale_0,
    bg1 = colors.funkey_grayscale_0,
    bg2 = colors.funkey_grayscale_25,
    bg3 = colors.funkey_grayscale_25,
    bg4 = colors.funkey_grayscale_50,
    bg5 = colors.funkey_grayscale_50,
    -- diffs (also for git)
    diff_delete = colors.funkey_color_8,
    diff_add = colors.funkey_color_3,
    diff_change = colors.funkey_color_2,
    -- UI
    button = colors.funkey_color_3,
    -- annotations
    error = colors.funkey_color_1 + gamma(0.3),
    warning = colors.funkey_color_2_dark,
    hint = colors.funkey_color_3_dark,
    info = colors.funkey_color_3_dark,
    -- syntax highlights
    keyword = colors.funkey_color_1,
    type = colors.funkey_color_2,
    constant = colors.funkey_color_3,
    operator = colors.funkey_grayscale_50,
    comment = colors.funkey_grayscale_50,
    -- tokyo colors (commented out if already replaced)
    orange = "#F6955B",
    yellow = "#D7A65F",
    green = "#95C561",
    blue = "#7199EE",
    cyan = "#38A89D",
    purple = "#A485DD",
    grey = "#4A5057",
    none = "NONE",
}

local function gamma_correction(colors)
    local colors_corrected = {}
    for k, v in pairs(colors) do
        colors_corrected[k] = utils.color_gamma(v, config.gamma)
    end
    return colors_corrected
end

local custom_palette = type(config.custom_palette) == "function"
    and config.custom_palette(palette)
    or config.custom_palette

return gamma_correction(vim.tbl_extend("force", palette, custom_palette))
