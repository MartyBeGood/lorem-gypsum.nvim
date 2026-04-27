local M = {}

M._version = "2.10.1" -- x-release-please-version

---@type lorem-gypsum.Config
M.defaults = {
  transparent = false,
  theme = {
    dark = "dark",
    light = "light",
  },
  styles = {
    functions = {},
    keywords = {},
    comments = {},
    strings = {},
    constants = {},
  },
  colors = {},
  auto = true,

  on_highlights = function(highlights, colors) end,
}

---@type lorem-gypsum.Config
M.options = vim.deepcopy(M.defaults) -- using this we can omit calling setup()

---@param opts lorem-gypsum.Config|nil
---@return lorem-gypsum.Config
function M.extend(opts)
  return vim.tbl_deep_extend("force", M.defaults, opts or {})
end

---@param opts lorem-gypsum.Config|nil
function M.setup(opts)
  M.options = M.extend(opts)
end

return M
