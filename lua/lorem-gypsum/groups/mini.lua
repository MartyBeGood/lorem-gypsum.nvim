local M = {}

---@type lorem-gypsum.HighlightsFn
function M.get_hl(c)
  -- stylua: ignore
  return {
    MiniPickMatchRanges       = { fg = c.highlight },
    MiniStatuslineModeNormal  = { fg = c.bg, bg = c.fg },
    MiniJump2dSpot            = { fg = c.bg, bg = c.warning, bold = true },
    MiniIconsGrey             = { fg = c.dim },
    MiniIconsAzure            = { fg = c.info },
    MiniIconsBlue             = { fg = c.func },
    MiniIconsCyan             = { fg = c.cyan },
    MiniIconsGreen            = { fg = c.success },
    MiniIconsOrange           = { fg = c.orange },
    MiniIconsPurple           = { fg = c.keyword },
    MiniIconsRed              = { fg = c.danger },
    MiniIconsYellow           = { fg = c.warning },
  }
end

return M
