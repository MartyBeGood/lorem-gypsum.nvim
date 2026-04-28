local M = {}

---@type lorem-gypsum.HighlightsFn
function M.get_hl(c)
  -- stylua: ignore
  return {
    BlinkCmpLabelMatch = { fg = c.const },
    BlinkCmpMenuBorder = { link = "PmenuBorder" },
  }
end

return M
