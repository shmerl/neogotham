local colors = require('neogotham/colors')
local util = require('neogotham/util')

-- main gotham palette
local gotham = colors.gotham

-- shortcuts to common foregrounds and backgrounds
local fg  = gotham[6] -- main foreground
local bg  = gotham[0] -- main background
local bg2 = gotham[1] -- secondary background for UI elements

-- For names of highlight groups and applied coloring, see:
-- :help highlight-groups
-- :help group-name
-- :help treesitter-highlight-groups
-- :help diagnostic-highlights
-- :help lsp-highlight
-- :help lsp-semantic-highlight

local common = {
  Normal      = { fg = fg, bg = bg },
  NormalFloat = { link = 'Pmenu' }, -- floating window

  -- cursor and cursor lines
  Cursor       = { fg = gotham[1], bg = gotham[6] },
  CursorColumn = { bg = bg2 },
  CursorLine   = { bg = bg2 },

  -- sign column and line numbers
  ColorColumn  = { bg = bg2 },
  CursorLineNr = { fg = gotham[5], bg = bg2 },
  LineNr       = { fg = colors.blue, bg = bg2 },
  SignColumn   = { bg = bg2 },

  -- command line elements and prompts
  Error      = { fg = colors.red, bg = bg2 },
  ErrorMsg   = { fg = colors.red, bg = bg2 },
  ModeMsg    = { fg = colors.blue },
  WarningMsg = { fg = colors.red, bg = bg2 },
  Question   = { fg = colors.green },

  -- other interface elements
  Conceal      = { fg = colors.cyan },
  Directory    = { fg = colors.cyan },
  Folded       = { bg = colors.blue },
  FoldColumn   = { fg = gotham[5], bg = gotham[3] },
  NonText      = { fg = colors.blue }, -- interface tildes
  Pmenu        = { bg = gotham[2] }, -- vertical popup menu elements
  PmenuSel     = { fg = gotham[7], bg = colors.blue },
  PmenuSbar    = { link = 'Pmenu' }, -- fill menu scrollbar with same color as menu itself
  PmenuThumb   = { bg = colors.blue },
  SpecialKey   = { fg = gotham[3] }, -- non whitespace special characters in 'listchars'. See ':help listchars'. Whitespace group links to NonText for whitespace ones
  StatusLine   = { fg = gotham[5], bg = gotham[2] }, -- also sets the color of the non-active entries in the wildmenu.
  StatusLineNC = { fg = colors.blue, bg = gotham[2] }, -- non current window's status line
  TabLine      = { bg = gotham[2] }, -- non-selected tabs
  TabLineFill  = { bg = bg }, -- the rest of the tab line
  TabLineSel   = { fg = gotham[7], bg = colors.blue }, -- selected tab
  Visual       = { bg = colors.gotham[3] }, -- visual selection
  WildMenu     = { fg = gotham[7], bg = colors.cyan }, -- horizontal wildmenu (active when wildoptions doesn't contain pum, otherwise see Pmenu* groups)
  WinSeparator = { fg = colors.blue, bg = bg2 }, -- splits and window separators

  -- syntax elements
  ['@variable'] = { link = 'Identifier' },
  Comment    = { fg = colors.blue },
  Constant   = { fg = colors.magenta },
  Delimiter  = { fg = gotham[5] },
  Function   = { fg = colors.violet },
  Identifier = { fg = fg },
  Number     = { fg = colors.orange },
  Operator   = { link = 'Statement' },
  PreProc    = { fg = colors.red },
  Special    = { fg = colors.orange },
  Statement  = { fg = gotham[5] },
  String     = { fg = colors.green },
  Title      = { fg = colors.orange }, -- Some HTML tags like <title>, <h*>s etc.
  Todo       = { fg = colors.magenta },
  Type       = { fg = colors.orange },
  Underlined = { fg = colors.yellow, underline = true }, -- <a> tags

  -- diff mode
  DiffAdd     = { fg = 'none', bg = colors.muddy_green },
  DiffDelete  = { fg = util.modify_brightness(colors.red, 1.1), bg = colors.muddy_red },
  DiffChange  = { fg = 'none', bg = util.modify_brightness(colors.blue, 0.55) },
  DiffText    = { fg = 'none', bg = colors.cyan },

  -- diff filetype (diffs, patches)
  Added       = { link = 'DiffAdd' },
  Removed     = { link = 'DiffDelete' },
  Changed     = { link = 'DiffChange' }
}

local neogotham = {
  Search     = { fg = colors.violet, bg = colors.yellow },
  CurSearch  = { fg = colors.violet, bg = colors.light_yellow },
  MatchParen = { fg = colors.neon_green, bold = true },

  -- new style of spelling with undercurl highlighting
  SpellBad   = { sp = colors.light_red, undercurl = true },
  SpellCap   = { sp = colors.light_yellow, undercurl = true },
  SpellRare  = { sp = colors.light_cyan, undercurl = true },
  SpellLocal = { sp = colors.light_green, undercurl = true }
}

local oldgotham = {
  Search     = { fg = gotham[2], bg = colors.yellow },
  CurSearch  = { link = 'Search' },
  IncSearch  = { reverse = true }, -- links to CurSearch by default (see CurSearch in neogotham section)
  MatchParen = { fg = fg, bg = colors.orange },

  -- old style of spelling with background highlighting
  SpellBad   = { fg = gotham[7], bg = colors.red },
  SpellCap   = { fg = gotham[7], bg = colors.blue },
  SpellRare  = { fg = gotham[7], bg = colors.violet },
  SpellLocal = { fg = colors.yellow },
}

local terminal = {
  -- colors 0 - 7
  terminal_color_0  = gotham[0],
  terminal_color_1  = colors.red,
  terminal_color_2  = colors.green,
  terminal_color_3  = colors.yellow,
  terminal_color_4  = colors.blue,
  terminal_color_5  = colors.violet,
  terminal_color_6  = colors.cyan,
  terminal_color_7  = gotham[6],

  -- colors 8 - 15 (should be brighter versions of 0 - 7, but now just reuses the same as original gotham did)
  terminal_color_8  = gotham[0],
  terminal_color_9  = colors.red,
  terminal_color_10 = colors.green,
  terminal_color_11 = colors.yellow,
  terminal_color_12 = colors.blue,
  terminal_color_13 = colors.violet,
  terminal_color_14 = colors.cyan,
  terminal_color_15 = gotham[6]
}

local Theme = {
  common = common,
  neogotham = neogotham,
  oldgotham = oldgotham,
  terminal = terminal
}

function Theme.set_highlights(highlights)
  for group, value in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, value)
  end
end

-- About built-in terminal colors, see :help terminal-config
function Theme:set_terminal_colors()
  for term_color, value in pairs(self.terminal) do
    vim.g[term_color] = value
  end
end

return Theme
