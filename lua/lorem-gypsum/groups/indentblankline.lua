local M = {}

--@type lorem-gypsum.HighlightsFn
function M.get_hl(c)
  -- stylua: ignore
  return {
    IblIndent = { fg = c.border },
  }
end

return M
