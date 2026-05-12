local M = {}

---@type lorem-gypsum.HighlightsFn
function M.get_hl(c, opts)
  -- stylua: ignore
  return {
    FzfLuaBackdrop  = { bg = opts.transparent and "none" or c.line },
    FzfLuaNormal    = { fg = c.fg, bg = opts.transparent and "none" or c.bg },
    FzfLuaBorder    = { fg = c.border, bg = opts.transparent and "none" or c.bg },
    FzfLuaPreviewNormal = { link = "FzfLuaNormal" },
    FzfLuaPreviewBorder = { link = "FzfLuaBorder" },
  }
end

return M
