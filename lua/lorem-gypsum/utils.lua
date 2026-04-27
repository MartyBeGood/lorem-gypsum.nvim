local M = {}

--- Unpacks the style table into main highlight groups
---@param groups lorem-gypsum.Highlights
---@return lorem-gypsum.Highlights
function M.unpack(groups)
  for _, hl in pairs(groups) do
    if hl.style and type(hl.style) == "table" then
      for k, v in pairs(hl.style) do
        hl[k] = v
      end
      hl.style = nil
    end
  end
  return groups
end

--- Converts a hex color string to an RGB table
---@param hex string A hex color string like "#RRGGBB"
---@return table
local function rgb(hex)
  hex = hex:lower()
  return {
    tonumber(hex:sub(2, 3), 16),
    tonumber(hex:sub(4, 5), 16),
    tonumber(hex:sub(6, 7), 16),
  }
end

--- Blends two colors based on alpha transparency
---@param foreground string Foreground hex color
---@param background string Background hex color
---@param alpha number Blend factor (0 to 1)
---@return string # A hex color string like "#RRGGBB"
function M.blend(foreground, background, alpha)
  local fg = rgb(foreground)
  local bg = rgb(background)

  local function blend_channel(i)
    local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
    return math.floor(math.min(math.max(0, ret), 255) + 0.5)
  end

  return string.format("#%02X%02X%02X", blend_channel(1), blend_channel(2), blend_channel(3))
end

function M.reload()
  for name, _ in pairs(package.loaded) do
    if name:match("^lorem-gypsum") and name ~= "lorem-gypsum.config" then
      package.loaded[name] = nil
    end
  end
  vim.notify("Koda reloaded", vim.log.levels.WARN)
  vim.cmd.colorscheme(vim.g.colors_name)
end

--- Resolves the current theme variant based on user config and background settings
---@param theme string|nil
---@return string
function M.resolve(theme)
  if theme then
    return theme
  end
  -- Fall back to `vim.o.background` when faulty values are passed to theme = {} during setup
  local ret = require("lorem-gypsum.config").options.theme[vim.o.background] or vim.o.background
  return ret
end

return M
