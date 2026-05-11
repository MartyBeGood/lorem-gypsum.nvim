local Utils = require("lorem-gypsum.utils")

local M = {}

-- stylua: ignore
M.plugins = {
  ["blink.cmp"]                = "blink",
  ["mason.nvim"]               = "mason",
  ["rainbow-delimiters.nvim"]  = "rainbow-delimiters",
  ["mini.nvim"]                = "mini",
  ["modes.nvim"]               = "modes",
  ["oil.nvim"]                 = "oil",
  ["dashboard-nvim"]           = "dashboard",
  ["flash.nvim"]               = "flash",
  ["fzf-lua"]                  = "fzf",
  ["gitsigns.nvim"]            = "gitsigns",
  ["vim-fugitive"]             = "fugitive",
  ["render-markdown.nvim"]     = "render-markdown",
  ["snacks.nvim"]              = "snacks",
  ["telescope.nvim"]           = "telescope",
  ["trouble.nvim"]             = "trouble",
  ["neo-tree.nvim"]            = "neotree",
}

--- Gets highlights from a specific group
---@param name string
---@param colors lorem-gypsum.Palette
---@param opts lorem-gypsum.Config
---@return lorem-gypsum.Highlights
function M.get_highlights(name, colors, opts)
  return require("lorem-gypsum.groups." .. name).get_hl(colors, opts)
end

---@param colors lorem-gypsum.Palette
---@param opts lorem-gypsum.Config
---@return lorem-gypsum.Highlights
---@return table
function M.setup(colors, opts, theme)
  -- Always load base groups
  local groups = { "base", "syntax", "treesitter", "lsp" }

  local function should_add_mini(names)
    if vim.list_contains(groups, "mini") then
      return false
    end
    for _, name in ipairs(names) do
      if name:match("^mini%.") then
        return true
      end
    end
    return false
  end

  -- Load highlights only for plugins managed by plugin managers
  -- Currently only supports lazy.nvim and vim.pack
  -- Setting `opts.auto=false` during setup will load all highlights
  if not opts.auto then
    for _, group in pairs(M.plugins) do
      table.insert(groups, group)
    end
  else
    local plugin_names = {}
    if package.loaded.lazy then -- try lazy.nvim
      plugin_names = vim.tbl_keys(require("lazy.core.config").plugins)
    elseif vim.pack then -- try vim.pack
      local ok, packdata = pcall(vim.pack.get, nil, { info = false })
      if ok and packdata then
        plugin_names = vim.tbl_map(function(p) return p.spec.name end, packdata)
      end
    elseif _G.MiniDeps then -- try mini.deps
      plugin_names = vim.tbl_map(function(p) return p.name end, _G.MiniDeps.get_session())
    end

    for _, plugin_name in ipairs(plugin_names) do
      local group = M.plugins[plugin_name]
      if group then
        table.insert(groups, group)
      end
    end

    if should_add_mini(plugin_names) then
      table.insert(groups, "mini")
    end
  end

  local hl = {}
  for _, group in ipairs(groups) do
    for k, v in pairs(M.get_highlights(group, colors, opts)) do
      hl[k] = v
    end
  end
  Utils.unpack(hl)
  opts.on_highlights(hl, colors)

  return hl, groups -- return groups table for testing purposes
end

return M
