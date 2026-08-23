local M = {}

--- Cooklang-specific highlights, see `:h treesitter-highlight` and
--- `~/.local/share/nvim/site/queries/cooklang/highlights.scm`
---@type lorem-gypsum.HighlightsFn
function M.get_hl(c)
  -- stylua: ignore
  return {
    ["@punctuation.delimiter.cooklang"] = { fg = c.type },     -- @ ~ # markers
    ["@string.special.symbol.cooklang"] = { fg = c.emphasis }, -- ingredient/cookware/timer names
    ["@punctuation.special.cooklang"]   = { fg = c.special },  -- % scaling operator
  }
end

return M
