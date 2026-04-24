local Utils = require("lorem-gypsum.utils")
local Palette = require("lorem-gypsum.palette.dark")
local Groups = require("lorem-gypsum.groups")

describe("File integrity:", function()
  it("can require every file in lorem-gypsum/groups without syntax errors", function()
    local path = "lua/lorem-gypsum/groups"
    local files = vim.split(vim.fn.glob(path .. "/*.lua"), "\n")
    for _, file in ipairs(files) do
      local name = vim.fn.fnamemodify(file, ":t:r")
      if name ~= "init" then
        local ok, mod = pcall(require, "lorem-gypsum.groups." .. name)

        assert.is_true(ok, "Failed to load file: " .. name)
        assert.is_table(mod, "Module " .. name .. " did not return a table")
      end
    end
  end)
end)

describe("Plugin detection logic:", function()
  local colors = Palette
  local original_api = vim.pack

  before_each(function()
    package.loaded["lazy"] = nil
    package.loaded["lazy.core.config"] = nil
    package.loaded["lorem-gypsum.utils"] = nil
    package.loaded["lorem-gypsum.groups"] = nil
    vim.pack = original_api
    Utils.cache.clear()
  end)

  it("loads only base groups when auto=true and no managers present", function()
    local config = require("lorem-gypsum.config")
    local opts = config.extend({ auto = true })
    local _, loaded = Groups.setup(colors, opts)

    assert.is_true(loaded["base"])
    assert.is_nil(loaded["gitsigns"])
  end)

  it("loads all plugins when auto=false", function()
    local config = require("lorem-gypsum.config")
    local opts = config.extend({ auto = false })
    local _, loaded = Groups.setup(colors, opts)

    assert.is_true(loaded["telescope"], "Telescope should be laoded")
    assert.is_true(loaded["blink"], "Blink should be loaded")
  end)

  it("respects lazy.nvim detection", function()
    package.loaded.lazy = true
    package.loaded["lazy.core.config"] = {
      plugins = {
        ["telescope.nvim"] = { name = "telescope.nvim" },
      },
    }
    local config = require("lorem-gypsum.config")
    local opts = config.extend({ auto = true })
    local _, loaded = Groups.setup(colors, opts)

    assert.is_true(loaded["telescope"], "Telescope should be loaded")
    assert.is_nil(loaded["blink.cmp"], "Blink should NOT be loaded")
  end)

  it("respects vim.pack detection", function()
    package.loaded["lazy"] = nil
    package.loaded["lazy.core.config"] = nil
    vim.pack = {
      get = function()
        return {
          {
            active = true,
            spec = { name = "blink.cmp" },
          },
        }
      end,
    }
    local config = require("lorem-gypsum.config")
    local opts = config.extend({ auto = true })
    local _, loaded = Groups.setup(colors, opts)

    assert.is_true(loaded["blink"], "Blink should be loaded via vim.pack")
    assert.is_nil(loaded["telescope"], "Telescope should NOT be loaded")
  end)
end)
