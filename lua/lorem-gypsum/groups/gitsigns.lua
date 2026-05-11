local M = {}

local Utils = require("lorem-gypsum.utils")

---@type lorem-gypsum.HighlightsFn
function M.get_hl(c)
  -- stylua: ignore
  return {
    GitSignsAdd           = { link = "GitAdded" },
    GitSignsChange        = { link = "GitModified" },
    GitSignsDelete        = { link = "GitDeleted" },
    GitSignsDeleteInline  = { link = "DiffChange" },
    GitSignsAddInline     = { link = "DiffChange" },
    GitSignsChangeInLine  = { link = "DiffChange" },
    GitSignsCurrentLineBlame = { fg = Utils.blend(c.fg, c.line, 0.4) },
  }
end

return M
