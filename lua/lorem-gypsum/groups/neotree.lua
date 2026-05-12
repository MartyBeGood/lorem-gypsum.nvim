local M = {}

---@type lorem-gypsum.HighlightsFn
function M.get_hl(c)
  -- stylua: ignore
  return {
    NeoTreeIndentMarker = { fg = c.border },
    NeoTreeDimText = { link = "NonText" },
    NeoTreeDirectoryIcon = { fg = c.warning },
    NeoTreeGitModified   = { link = "GitModified" },
    NeoTreeGitAdded      = { link = "GitAdded" },
    NeoTreeGitDeleted    = { link = "GitDeleted" },
    NeoTreeGitStaged     = { link = "GitStaged" },
    NeoTreeGitConflict   = { fg = c.red },
    NeoTreeGitUntracked  = { link = "GitUntracked" },
    NeoTreeGitUnstaged   = { link = "GitUnstaged" },
  }
end

return M
