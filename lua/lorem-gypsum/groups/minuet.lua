local M = {}

---@type lorem-gypsum.HighlightsFn
function M.get_hl(c)
  -- stylua: ignore
  return {
    MinuetVirtualText = { link = "AiVirtualText" },
  }
end

return M
