local M = {}

---@type lorem-gypsum.HighlightsFn
function M.get_hl(c, opts)
  -- stylua: ignore
  return {
    FzfLuaBackdrop = { bg = opts.transparent and "none" or c.line },
    FzfLuaBorder = { link = "FloatBorder" },
  }
end

return M
