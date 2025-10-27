local U = {}

-- Convert a hex color to RGB values.
function U.hex2rgb(hex)
    hex = hex:gsub("#", "")
    return tonumber("0x" .. hex:sub(1, 2)),
        tonumber("0x" .. hex:sub(3, 4)),
        tonumber("0x" .. hex:sub(5, 6))
end

-- Adjust the lightness of an RGB color.
function U.lightness_corrector(r, g, b, lightness_delta)
    -- Convert RGB to HSL
    r, g, b = r / 255, g / 255, b / 255

    local max = math.max(r, g, b)
    local min = math.min(r, g, b)
    local h, s, l

    l = (max + min) / 2

    if max == min then
        h, s = 0, 0 -- achromatic
    else
        local d = max - min
        s = l > 0.5 and d / (2 - max - min) or d / (max + min)
        if max == r then
            h = (g - b) / d + (g < b and 6 or 0)
        elseif max == g then
            h = (b - r) / d + 2
        else
            h = (r - g) / d + 4
        end
        h = h / 6
    end

    l = math.max(0, math.min(1, l + lightness_delta))

    local function hue_to_rgb(p, q, t)
        if t < 0 then t = t + 1 end
        if t > 1 then t = t - 1 end
        if t < 1 / 6 then return p + (q - p) * 6 * t end
        if t < 1 / 2 then return q end
        if t < 2 / 3 then return p + (q - p) * (2 / 3 - t) * 6 end
        return p
    end

    local r_out, g_out, b_out
    if s == 0 then
        r_out, g_out, b_out = l, l, l -- achromatic
    else
        local q = l < 0.5 and l * (1 + s) or l + s - l * s
        local p = 2 * l - q
        r_out = hue_to_rgb(p, q, h + 1 / 3)
        g_out = hue_to_rgb(p, q, h)
        b_out = hue_to_rgb(p, q, h - 1 / 3)
    end

    return math.floor(r_out * 255 + 0.5),
        math.floor(g_out * 255 + 0.5),
        math.floor(b_out * 255 + 0.5)
end

-- Linearly interpolate between two colors.
function U.interpolate_color(r1, g1, b1, r2, g2, b2, alpha)
    -- Clamp alpha to [0, 1]
    alpha = math.max(0, math.min(1, alpha))

    -- Linear interpolation for each channel
    local r = r1 + (r2 - r1) * alpha
    local g = g1 + (g2 - g1) * alpha
    local b = b1 + (b2 - b1) * alpha

    return math.floor(r + 0.5),
        math.floor(g + 0.5),
        math.floor(b + 0.5)
end

-- Adjust the lightness of a hex color.
function U.color_lightness(hex, lightness)
    if hex:find("#") == nil then
        return hex
    end
    local r, g, b = U.hex2rgb(hex)
    r, g, b = U.lightness_corrector(r, g, b, lightness)
    return string.format("#%02x%02x%02x", r, g, b)
end

-- Linearly interpolate between two hex colors.
function U.interpolate(hex1, hex2, alpha)
    if hex1:find("#") == nil or hex2:find("#") == nil then
        return hex1
    end
    local r1, g1, b1 = U.hex2rgb(hex1)
    local r2, g2, b2 = U.hex2rgb(hex2)
    local r, g, b = U.interpolate_color(r1, g1, b1, r2, g2, b2, alpha)
    return string.format("#%02x%02x%02x", r, g, b)
end

function U.check_min_version(major, minor, patch)
    return vim.version.gt({ major, minor, patch }, vim.version())
end

return U
