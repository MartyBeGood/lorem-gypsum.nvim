local M = {}

local Utils = require("lorem-gypsum.utils")

---@type lorem-gypsum.HighlightsFn
function M.get_hl(c)
  -- stylua: ignore
  return {
    fugitiveStagedHeading      = { fg = c.success },
    fugitiveStagedModifier     = { fg = c.success },
    fugitiveUnstagedHeading    = { fg = c.warning },
    fugitiveUnstagedModifier   = { fg = c.warning },
    fugitiveUntrackedHeading   = { fg = c.info },
    fugitiveUntrackedModifier  = { fg = c.info },
    fugitiveCount              = { link = "Normal" }
  }
end

return M
