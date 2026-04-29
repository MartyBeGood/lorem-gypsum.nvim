local Utils = require("lorem-gypsum.utils")

local M = {}

--- Get base highlight groups, see `:h highlight-groups`
---@type lorem-gypsum.HighlightsFn
function M.get_hl(c, opts)
  -- stylua: ignore
  return {
    Normal            = { fg = c.fg, bg = opts.transparent and "none" or c.bg },
    NormalFloat       = { link = "Normal" },
    FloatBorder       = { fg = c.border, bg = opts.transparent and "none" or c.bg, },
    Cursor            = { fg = c.fg, bg = c.fg },
    TermCursor        = { link = "Cursor" },
    lCursor           = { link = "Cursor" },
    CursorIM          = { link = "Cursor" },
    CursorColumn      = { bg = c.line },
    CursorLine        = { bg = c.line },
    ColorColumn       = { bg = c.line },
    CursorLineNr      = { fg = c.special, bold = true },
    LineNr            = { fg = c.dim },
    StatusLine        = { fg = c.fg, bg = opts.transparent and "none" or c.line },
    StatusLineNC      = { link = "Normal" },
    StatusLineTerm    = { link = "StatusLine" },
    StatusLineTermNC  = { link = "StatusLineNC" },
    WinBar            = { link = "Normal" },
    WinBarNC          = { link = "Normal" },
    WinSeparator      = { fg = c.border },
    Pmenu             = { bg = opts.transparent and "none" or c.bg },
    PmenuSel          = { fg = c.fg, bg = c.line, bold = true },
    PmenuThumb        = { bg = c.fg },
    PmenuMatch        = { fg = c.const, bold = true },
    PmenuBorder       = { link = "FloatBorder" },
    Visual            = { bg = c.selection },
    Search            = { bg = Utils.blend(c.selection, c.bg, 0.6) },
    LspReferenceText  = { bg = Utils.blend(c.dim, c.bg, 0.3) },
    CurSearch         = { link = "DiffChange" },
    IncSearch         = { link = "CurSearch" },
    Substitute        = { link = "DiffAdd" },
    MatchParen        = { fg = c.special, bold = true },
    NonText           = { fg = c.dim },
    EndOfBuffer       = { fg = c.line },
    Question          = { fg = c.const },
    MoreMsg           = { link = "Question" },
    ErrorMsg          = { fg = c.danger },
    WarningMsg        = { link = "Question" },
    ModeMsg           = { link = "Question" },
    MsgSeparator      = { fg = c.fg },
    Directory         = { fg = c.emphasis },
    QuickFixLine      = { fg = c.const, underline = true },
    qfLineNr          = { link = "LineNr" },
    SpecialKey        = { fg = c.comment },
    TabLineSel        = { fg = c.emphasis, bg = c.line },
    Title             = { fg = c.emphasis, bold = true },
    DiffAdd           = { fg = c.success, bg = Utils.blend(c.success, c.bg, 0.2) },
    DiffChange        = { fg = c.warning, bg = Utils.blend(c.warning, c.bg, 0.2) },
    DiffDelete        = { fg = c.danger, bg = Utils.blend(c.danger, c.bg, 0.2) },
    DiffText          = { fg = c.warning, bg = Utils.blend(c.warning, c.bg, 0.4) },

    -- TODO: Check how these look
    TodoFgTODO        = { fg = c.const },
    TodoBgTODO        = { fg = c.const, bg = Utils.blend(c.const, c.bg, 0.1), bold = true },
    TodoSignTODO      = { fg = c.const, bold = true },

    -- FIX: Check how these look
    TodoFgFIX         = { fg = c.danger },
    TodoBgFIX         = { fg = c.danger, bg = Utils.blend(c.danger, c.bg, 0.2), bold = true },
    TodoSignFIX       = { fg = c.danger, bold = true },

    -- PERF: Check how these look
    TodoFgPERF        = { link = "TodoFgTODO" },
    TodoBgPERF        = { link = "TodoBgTODO" },
    TodoSignPERF      = { link = "TodoSignTODO" },

    -- WARN: Check how these look
    TodoFgWARN        = { fg = c.warning },
    TodoBgWARN        = { fg = c.warning, bg = Utils.blend(c.warning, c.bg, 0.2), bold = true },
    TodoSignWARN      = { fg = c.warning },

    -- HACK: Check how these look
    TodoFgHACK        = { fg = c.warning },
    TodoBgHACK        = { fg = c.warning, bg = Utils.blend(c.warning, c.bg, 0.2), bold = true },
    TodoSignHACK      = { fg = c.warning, bold = true },

    -- TEST: Check how these look
    TodoFgTEST        = { link = "TodoFgTODO" },
    TodoBgTEST        = { link = "TodoBgTODO" },
    TodoSignTEST      = { link = "TodoSignTODO" },

    -- NOTE: Check how these look
    TodoFgNOTE        = { fg = c.highlight },
    TodoBgNOTE        = { fg = c.highlight, bg = Utils.blend(c.highlight, c.bg, 0.2), bold = true },
    TodoSignNOTE      = { fg = c.highlight },
  }
end

return M
