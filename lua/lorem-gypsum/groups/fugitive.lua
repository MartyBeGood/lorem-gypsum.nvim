local M = {}

local Utils = require("lorem-gypsum.utils")

---@type lorem-gypsum.HighlightsFn
function M.get_hl(c)
  -- stylua: ignore
  return {
    fugitiveStagedHeading      = { link = "GitStaged" },
    fugitiveStagedModifier     = { link = "GitStaged" },
    fugitiveUnstagedHeading    = { link = "GitUnstaged" },
    fugitiveUnstagedModifier   = { link = "GitUnstaged" },
    fugitiveUntrackedHeading   = { link = "GitUntracked" },
    fugitiveUntrackedModifier  = { link = "GitUntracked" },
    fugitiveCount              = { link = "Normal" }
  }
end

return M
