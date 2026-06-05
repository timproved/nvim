-- ef-dream.lua
-- Neovim port of Protesilaos Stavrou's ef-dream Emacs theme.
-- Original: https://github.com/protesilaos/ef-themes
--
-- Usage:
--   vim.cmd.colorscheme("ef-dream")

local M = {}

local p = {
  cursor = "#f3c09a",

  bg_main = "#0b0b0c",
  bg_dim = "#151417",
  bg_alt = "#1c1b1f",

  fg_main = "#efd5c5",
  fg_dim = "#8f8886",
  fg_alt = "#b0a0cf",

  bg_active = "#323035",
  bg_inactive = "#17161a",
  border = "#4a4140",

  red = "#ff6f6f",
  red_warmer = "#ff7a5f",
  red_cooler = "#e47980",
  red_faint = "#f3a0a0",

  green = "#51b04f",
  green_warmer = "#7fce5f",
  green_cooler = "#3fc489",
  green_faint = "#a9c99f",

  yellow = "#c0b24f",
  yellow_warmer = "#d09950",
  yellow_cooler = "#deb07a",
  yellow_faint = "#caa89f",

  blue = "#57b0ff",
  blue_warmer = "#80aadf",
  blue_cooler = "#12b4ff",
  blue_faint = "#a0a0cf",

  magenta = "#ffaacf",
  magenta_warmer = "#f498c0",
  magenta_cooler = "#d0b0ff",
  magenta_faint = "#e3b0c0",

  cyan = "#6fb3c0",
  cyan_warmer = "#8fcfd0",
  cyan_cooler = "#65c5a8",
  cyan_faint = "#99bfcf",

  bg_red_intense = "#a02f50",
  bg_green_intense = "#30682f",
  bg_yellow_intense = "#8f665f",
  bg_blue_intense = "#4f509f",
  bg_magenta_intense = "#885997",
  bg_cyan_intense = "#0280b9",

  bg_red_subtle = "#6f202a",
  bg_green_subtle = "#2a532f",
  bg_yellow_subtle = "#62432a",
  bg_blue_subtle = "#3a3e73",
  bg_magenta_subtle = "#66345a",
  bg_cyan_subtle = "#334d69",

  bg_added = "#304a4f",
  bg_added_faint = "#16383f",
  bg_added_refine = "#2f6767",
  fg_added = "#a0d0f0",

  bg_changed = "#51512f",
  bg_changed_faint = "#40332f",
  bg_changed_refine = "#64651f",
  fg_changed = "#dada90",

  bg_removed = "#5a3142",
  bg_removed_faint = "#4a2034",
  bg_removed_refine = "#782a4a",
  fg_removed = "#f0bfcf",

  bg_mode_line_active = "#49384f",
  fg_mode_line_active = "#fedeff",
  bg_completion = "#211920",
  bg_popup = "#121113",
  bg_hover = "#443036",
  bg_hover_secondary = "#393244",
  bg_hl_line = "#181a1a",
  bg_paren_match = "#7c4d5f",
  bg_err = "#35131f",
  bg_warning = "#342720",
  bg_info = "#0b2d38",
  bg_region = "#3d363b",
}

local s = {
  err = p.magenta_warmer,
  warning = p.yellow_warmer,
  info = p.cyan,

  fg_link = p.yellow_cooler,
  fg_link_visited = p.cyan_warmer,
  name = p.cyan_warmer,
  keybind = p.cyan,
  identifier = p.yellow_cooler,
  fg_prompt = p.magenta,

  builtin = p.magenta_faint,
  comment = p.blue_faint,
  constant = p.blue_warmer,
  fnname = p.cyan_warmer,
  fnname_call = p.cyan_faint,
  keyword = p.yellow_cooler,
  preprocessor = p.cyan_cooler,
  docstring = p.yellow_faint,
  string = p.red_faint,
  type = p.green_faint,
  variable = p.magenta,
  variable_use = p.magenta_faint,
  rx_backslash = p.cyan_cooler,
  rx_construct = p.red_cooler,

  accent_0 = p.yellow_cooler,
  accent_1 = p.red_cooler,
  accent_2 = p.magenta_warmer,
  accent_3 = p.blue_warmer,
}

local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

local function set_terminal_colors()
  vim.g.terminal_color_0 = p.bg_main
  vim.g.terminal_color_1 = p.red
  vim.g.terminal_color_2 = p.green
  vim.g.terminal_color_3 = p.yellow
  vim.g.terminal_color_4 = p.blue
  vim.g.terminal_color_5 = p.magenta
  vim.g.terminal_color_6 = p.cyan
  vim.g.terminal_color_7 = p.fg_main

  vim.g.terminal_color_8 = p.bg_active
  vim.g.terminal_color_9 = p.red_warmer
  vim.g.terminal_color_10 = p.green_warmer
  vim.g.terminal_color_11 = p.yellow_warmer
  vim.g.terminal_color_12 = p.blue_warmer
  vim.g.terminal_color_13 = p.magenta_warmer
  vim.g.terminal_color_14 = p.cyan_warmer
  vim.g.terminal_color_15 = "#ffffff"
end

function M.setup()
  vim.cmd("highlight clear")

  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end

  vim.o.termguicolors = true
  vim.o.background = "dark"
  vim.g.colors_name = "ef-dream"

  set_terminal_colors()

  -- Editor UI
  hl("Normal", { fg = p.fg_main, bg = p.bg_main })
  hl("NormalNC", { fg = p.fg_main, bg = p.bg_main })
  hl("NormalFloat", { fg = p.fg_main, bg = p.bg_popup })
  hl("FloatBorder", { fg = p.border, bg = p.bg_popup })
  hl("FloatTitle", { fg = s.name, bg = p.bg_popup, bold = true })

  hl("Cursor", { fg = p.bg_main, bg = p.cursor })
  hl("CursorLine", { bg = p.bg_hl_line })
  hl("CursorColumn", { bg = p.bg_hl_line })
  hl("ColorColumn", { bg = p.bg_dim })

  hl("LineNr", { fg = p.fg_dim, bg = p.bg_main })
  hl("CursorLineNr", { fg = p.yellow_cooler, bg = p.bg_hl_line, bold = true })
  hl("SignColumn", { fg = p.fg_dim, bg = p.bg_main })
  hl("FoldColumn", { fg = p.fg_dim, bg = p.bg_main })
  hl("Folded", { fg = p.fg_alt, bg = p.bg_dim })

  hl("Visual", { bg = p.bg_region })
  hl("VisualNOS", { bg = p.bg_region })
  hl("Search", { fg = p.fg_main, bg = p.bg_warning })
  hl("IncSearch", { fg = p.fg_main, bg = p.bg_yellow_intense })
  hl("CurSearch", { fg = p.fg_main, bg = p.bg_yellow_intense })

  hl("Substitute", { fg = p.fg_main, bg = p.bg_red_intense })
  hl("MatchParen", { fg = p.fg_main, bg = p.bg_paren_match, bold = true })

  hl("Pmenu", { fg = p.fg_main, bg = p.bg_popup })
  hl("PmenuSel", { fg = p.fg_mode_line_active, bg = p.bg_mode_line_active })
  hl("PmenuSbar", { bg = p.bg_dim })
  hl("PmenuThumb", { bg = p.bg_active })

  hl("StatusLine", {
    fg = p.fg_mode_line_active,
    bg = p.bg_mode_line_active,
  })
  hl("StatusLineNC", { fg = p.fg_dim, bg = p.bg_inactive })
  hl("WinBar", { fg = p.fg_main, bg = p.bg_main })
  hl("WinBarNC", { fg = p.fg_dim, bg = p.bg_main })

  hl("TabLine", { fg = p.fg_dim, bg = p.bg_inactive })
  hl("TabLineSel", { fg = p.fg_mode_line_active, bg = p.bg_mode_line_active })
  hl("TabLineFill", { bg = p.bg_dim })

  hl("VertSplit", { fg = p.border, bg = p.bg_main })
  hl("WinSeparator", { fg = p.border, bg = p.bg_main })

  hl("Directory", { fg = s.name })
  hl("Title", { fg = p.magenta_warmer, bold = true })
  hl("Question", { fg = s.fg_prompt })
  hl("MoreMsg", { fg = s.info })
  hl("WarningMsg", { fg = s.warning })
  hl("ErrorMsg", { fg = s.err, bg = p.bg_err })
  hl("ModeMsg", { fg = p.fg_alt })
  hl("NonText", { fg = p.fg_dim })
  hl("SpecialKey", { fg = p.fg_dim })
  hl("Whitespace", { fg = p.bg_active })
  hl("EndOfBuffer", { fg = p.bg_main })

  -- Basic syntax
  hl("Comment", { fg = s.comment, italic = true })
  hl("Constant", { fg = s.constant })
  hl("String", { fg = s.string })
  hl("Character", { fg = p.red_cooler })
  hl("Number", { fg = s.constant })
  hl("Boolean", { fg = s.constant, bold = true })
  hl("Float", { fg = s.constant })

  hl("Identifier", { fg = s.identifier })
  hl("Function", { fg = s.fnname })

  hl("Statement", { fg = s.keyword })
  hl("Conditional", { fg = s.keyword })
  hl("Repeat", { fg = s.keyword })
  hl("Label", { fg = p.yellow_warmer })
  hl("Operator", { fg = p.fg_main })
  hl("Keyword", { fg = s.keyword })
  hl("Exception", { fg = p.red_cooler })

  hl("PreProc", { fg = s.preprocessor })
  hl("Include", { fg = s.preprocessor })
  hl("Define", { fg = s.preprocessor })
  hl("Macro", { fg = s.preprocessor })
  hl("PreCondit", { fg = s.preprocessor })

  hl("Type", { fg = s.type })
  hl("StorageClass", { fg = s.keyword })
  hl("Structure", { fg = s.keyword })
  hl("Typedef", { fg = s.type })

  hl("Special", { fg = p.magenta_faint })
  hl("SpecialChar", { fg = p.cyan_cooler })
  hl("Tag", { fg = p.yellow_faint })
  hl("Delimiter", { fg = p.fg_main })
  hl("SpecialComment", { fg = s.docstring, italic = true })
  hl("Debug", { fg = p.red_cooler })

  hl("Underlined", { fg = s.fg_link, underline = true })
  hl("Ignore", { fg = p.fg_dim })
  hl("Error", { fg = s.err, bg = p.bg_err })
  hl("Todo", { fg = p.yellow_warmer, bg = p.bg_warning, bold = true })

  -- Diagnostics
  hl("DiagnosticError", { fg = s.err })
  hl("DiagnosticWarn", { fg = s.warning })
  hl("DiagnosticInfo", { fg = s.info })
  hl("DiagnosticHint", { fg = p.cyan_faint })
  hl("DiagnosticOk", { fg = p.green_cooler })

  hl("DiagnosticVirtualTextError", { fg = s.err, bg = p.bg_err })
  hl("DiagnosticVirtualTextWarn", { fg = s.warning, bg = p.bg_warning })
  hl("DiagnosticVirtualTextInfo", { fg = s.info, bg = p.bg_info })
  hl("DiagnosticVirtualTextHint", { fg = p.cyan_faint, bg = p.bg_info })

  hl("DiagnosticUnderlineError", { sp = s.err, undercurl = true })
  hl("DiagnosticUnderlineWarn", { sp = s.warning, undercurl = true })
  hl("DiagnosticUnderlineInfo", { sp = s.info, undercurl = true })
  hl("DiagnosticUnderlineHint", { sp = p.cyan_faint, undercurl = true })

  hl("DiagnosticSignError", { fg = s.err, bg = p.bg_main })
  hl("DiagnosticSignWarn", { fg = s.warning, bg = p.bg_main })
  hl("DiagnosticSignInfo", { fg = s.info, bg = p.bg_main })
  hl("DiagnosticSignHint", { fg = p.cyan_faint, bg = p.bg_main })

  -- Diff
  hl("DiffAdd", { fg = p.fg_added, bg = p.bg_added_faint })
  hl("DiffChange", { fg = p.fg_changed, bg = p.bg_changed_faint })
  hl("DiffDelete", { fg = p.fg_removed, bg = p.bg_removed_faint })
  hl("DiffText", { fg = p.fg_changed, bg = p.bg_changed_refine })

  hl("Added", { fg = p.fg_added })
  hl("Changed", { fg = p.fg_changed })
  hl("Removed", { fg = p.fg_removed })

  -- Git signs
  hl("GitSignsAdd", { fg = p.fg_added, bg = p.bg_main })
  hl("GitSignsChange", { fg = p.fg_changed, bg = p.bg_main })
  hl("GitSignsDelete", { fg = p.fg_removed, bg = p.bg_main })

  -- LSP references
  hl("LspReferenceText", { bg = p.bg_hover_secondary })
  hl("LspReferenceRead", { bg = p.bg_hover_secondary })
  hl("LspReferenceWrite", { bg = p.bg_hover })

  -- Treesitter
  hl("@comment", { link = "Comment" })
  hl("@none", { fg = p.fg_main })
  hl("@preproc", { fg = s.preprocessor })
  hl("@define", { fg = s.preprocessor })
  hl("@operator", { fg = p.fg_main })
  hl("@punctuation", { fg = p.fg_main })
  hl("@punctuation.delimiter", { fg = p.fg_main })
  hl("@punctuation.bracket", { fg = p.fg_main })
  hl("@punctuation.special", { fg = p.cyan_cooler })

  hl("@string", { fg = s.string })
  hl("@string.documentation", { fg = s.docstring, italic = true })
  hl("@string.regex", { fg = p.red_cooler })
  hl("@string.escape", { fg = p.cyan_cooler })
  hl("@character", { fg = p.red_cooler })
  hl("@character.special", { fg = p.cyan_cooler })

  hl("@boolean", { fg = s.constant, bold = true })
  hl("@number", { fg = s.constant })
  hl("@number.float", { fg = s.constant })

  hl("@function", { fg = s.fnname })
  hl("@function.call", { fg = s.fnname_call })
  hl("@function.builtin", { fg = s.builtin })
  hl("@function.macro", { fg = s.preprocessor })
  hl("@method", { fg = s.fnname })
  hl("@method.call", { fg = s.fnname_call })
  hl("@constructor", { fg = s.type })

  hl("@parameter", { fg = s.variable })
  hl("@variable", { fg = s.variable_use })
  hl("@variable.builtin", { fg = s.builtin })
  hl("@constant", { fg = s.constant })
  hl("@constant.builtin", { fg = s.builtin })
  hl("@constant.macro", { fg = s.preprocessor })

  hl("@module", { fg = s.name })
  hl("@label", { fg = p.yellow_warmer })

  hl("@type", { fg = s.type })
  hl("@type.builtin", { fg = s.type, bold = true })
  hl("@type.definition", { fg = s.type })
  hl("@attribute", { fg = p.magenta_faint })
  hl("@property", { fg = s.identifier })
  hl("@field", { fg = s.identifier })

  hl("@keyword", { fg = s.keyword })
  hl("@keyword.function", { fg = s.keyword })
  hl("@keyword.operator", { fg = s.keyword })
  hl("@keyword.return", { fg = s.keyword })
  hl("@keyword.import", { fg = s.preprocessor })
  hl("@keyword.conditional", { fg = s.keyword })
  hl("@keyword.repeat", { fg = s.keyword })
  hl("@keyword.exception", { fg = p.red_cooler })

  hl("@tag", { fg = p.yellow_faint })
  hl("@tag.attribute", { fg = s.identifier })
  hl("@tag.delimiter", { fg = p.fg_main })

  -- Treesitter aliases for newer Neovim versions
  hl("@variable.parameter", { fg = s.variable })
  hl("@variable.member", { fg = s.identifier })
  hl("@function.method", { fg = s.fnname })
  hl("@function.method.call", { fg = s.fnname_call })
  hl("@keyword.directive", { fg = s.preprocessor })
  hl("@keyword.directive.define", { fg = s.preprocessor })
  hl("@markup.heading", { fg = p.magenta_warmer, bold = true })
  hl("@markup.link", { fg = s.fg_link, underline = true })
  hl("@markup.link.url", { fg = s.fg_link, underline = true })
  hl("@markup.raw", { fg = p.blue_warmer })
  hl("@markup.strong", { bold = true })
  hl("@markup.italic", { italic = true })
  hl("@markup.strikethrough", { strikethrough = true })
  hl("@markup.list", { fg = p.yellow_cooler })
  hl("@markup.quote", { fg = p.fg_alt, italic = true })

  -- Completion plugins / cmp
  hl("CmpItemAbbr", { fg = p.fg_main })
  hl("CmpItemAbbrDeprecated", { fg = p.fg_dim, strikethrough = true })
  hl("CmpItemAbbrMatch", { fg = p.cyan_warmer, bold = true })
  hl("CmpItemAbbrMatchFuzzy", { fg = p.cyan_warmer, bold = true })
  hl("CmpItemMenu", { fg = p.fg_alt })

  hl("CmpItemKindText", { fg = p.fg_main })
  hl("CmpItemKindMethod", { fg = s.fnname })
  hl("CmpItemKindFunction", { fg = s.fnname })
  hl("CmpItemKindConstructor", { fg = s.type })
  hl("CmpItemKindField", { fg = s.identifier })
  hl("CmpItemKindVariable", { fg = s.variable_use })
  hl("CmpItemKindClass", { fg = s.type })
  hl("CmpItemKindInterface", { fg = s.type })
  hl("CmpItemKindModule", { fg = s.name })
  hl("CmpItemKindProperty", { fg = s.identifier })
  hl("CmpItemKindUnit", { fg = s.constant })
  hl("CmpItemKindValue", { fg = s.constant })
  hl("CmpItemKindEnum", { fg = s.type })
  hl("CmpItemKindKeyword", { fg = s.keyword })
  hl("CmpItemKindSnippet", { fg = p.magenta_warmer })
  hl("CmpItemKindColor", { fg = p.magenta_warmer })
  hl("CmpItemKindFile", { fg = s.name })
  hl("CmpItemKindReference", { fg = p.cyan_faint })
  hl("CmpItemKindFolder", { fg = s.name })
  hl("CmpItemKindEnumMember", { fg = s.constant })
  hl("CmpItemKindConstant", { fg = s.constant })
  hl("CmpItemKindStruct", { fg = s.type })
  hl("CmpItemKindEvent", { fg = p.yellow_warmer })
  hl("CmpItemKindOperator", { fg = p.fg_main })
  hl("CmpItemKindTypeParameter", { fg = s.type })

  -- Telescope
  hl("TelescopeNormal", { fg = p.fg_main, bg = p.bg_popup })
  hl("TelescopeBorder", { fg = p.border, bg = p.bg_popup })
  hl("TelescopePromptNormal", { fg = p.fg_main, bg = p.bg_completion })
  hl("TelescopePromptBorder", { fg = p.border, bg = p.bg_completion })
  hl("TelescopePromptTitle", {
    fg = p.fg_mode_line_active,
    bg = p.bg_mode_line_active,
  })
  hl("TelescopeResultsTitle", { fg = p.bg_popup, bg = p.bg_popup })
  hl("TelescopePreviewTitle", {
    fg = p.fg_mode_line_active,
    bg = p.bg_mode_line_active,
  })
  hl("TelescopeSelection", { fg = p.fg_main, bg = p.bg_hover_secondary })
  hl("TelescopeMatching", { fg = p.yellow_cooler, bold = true })

  -- Which-key
  hl("WhichKey", { fg = p.cyan_warmer })
  hl("WhichKeyGroup", { fg = p.magenta })
  hl("WhichKeyDesc", { fg = p.fg_main })
  hl("WhichKeySeparator", { fg = p.fg_dim })
  hl("WhichKeyFloat", { bg = p.bg_popup })
  hl("WhichKeyValue", { fg = p.fg_dim })

  -- Lazy.nvim
  hl("LazyNormal", { fg = p.fg_main, bg = p.bg_popup })
  hl("LazyButton", { fg = p.fg_main, bg = p.bg_dim })
  hl("LazyButtonActive", { fg = p.fg_mode_line_active, bg = p.bg_mode_line_active })
  hl("LazyH1", { fg = p.fg_mode_line_active, bg = p.bg_mode_line_active, bold = true })
  hl("LazyH2", { fg = p.magenta_warmer, bold = true })

  -- Mason
  hl("MasonNormal", { fg = p.fg_main, bg = p.bg_popup })
  hl("MasonHeader", { fg = p.fg_mode_line_active, bg = p.bg_mode_line_active })
  hl("MasonHighlight", { fg = p.cyan_warmer })
  hl("MasonHighlightBlock", { fg = p.bg_main, bg = p.cyan_warmer })
  hl("MasonMuted", { fg = p.fg_dim })
  hl("MasonError", { fg = s.err })

  -- Neo-tree / nvim-tree
  hl("NeoTreeNormal", { fg = p.fg_main, bg = p.bg_main })
  hl("NeoTreeNormalNC", { fg = p.fg_main, bg = p.bg_main })
  hl("NeoTreeDirectoryName", { fg = s.name })
  hl("NeoTreeDirectoryIcon", { fg = s.name })
  hl("NeoTreeFileName", { fg = p.fg_main })
  hl("NeoTreeFileNameOpened", { fg = p.yellow_cooler })
  hl("NeoTreeRootName", { fg = p.magenta_warmer, bold = true })
  hl("NeoTreeGitAdded", { fg = p.fg_added })
  hl("NeoTreeGitModified", { fg = p.fg_changed })
  hl("NeoTreeGitDeleted", { fg = p.fg_removed })

  hl("NvimTreeNormal", { fg = p.fg_main, bg = p.bg_main })
  hl("NvimTreeFolderName", { fg = s.name })
  hl("NvimTreeFolderIcon", { fg = s.name })
  hl("NvimTreeOpenedFolderName", { fg = p.yellow_cooler })
  hl("NvimTreeRootFolder", { fg = p.magenta_warmer, bold = true })
  hl("NvimTreeGitNew", { fg = p.fg_added })
  hl("NvimTreeGitDirty", { fg = p.fg_changed })
  hl("NvimTreeGitDeleted", { fg = p.fg_removed })

  -- Indent guides
  hl("IndentBlanklineChar", { fg = p.bg_active })
  hl("IndentBlanklineContextChar", { fg = p.fg_dim })
  hl("IblIndent", { fg = p.bg_active })
  hl("IblScope", { fg = p.fg_dim })

  -- Mini.nvim
  hl("MiniStatuslineModeNormal", {
    fg = p.fg_mode_line_active,
    bg = p.bg_mode_line_active,
    bold = true,
  })
  hl("MiniStatuslineModeInsert", {
    fg = p.bg_main,
    bg = p.green_cooler,
    bold = true,
  })
  hl("MiniStatuslineModeVisual", {
    fg = p.bg_main,
    bg = p.magenta_warmer,
    bold = true,
  })
  hl("MiniStatuslineModeReplace", {
    fg = p.bg_main,
    bg = p.red_cooler,
    bold = true,
  })
  hl("MiniStatuslineModeCommand", {
    fg = p.bg_main,
    bg = p.yellow_cooler,
    bold = true,
  })
  hl("MiniStatuslineModeOther", {
    fg = p.bg_main,
    bg = p.cyan_warmer,
    bold = true,
  })

  -- Notify
  hl("NotifyERRORBorder", { fg = s.err })
  hl("NotifyWARNBorder", { fg = s.warning })
  hl("NotifyINFOBorder", { fg = s.info })
  hl("NotifyDEBUGBorder", { fg = p.fg_dim })
  hl("NotifyTRACEBorder", { fg = p.magenta_faint })
  hl("NotifyERRORTitle", { fg = s.err })
  hl("NotifyWARNTitle", { fg = s.warning })
  hl("NotifyINFOTitle", { fg = s.info })
  hl("NotifyDEBUGTitle", { fg = p.fg_dim })
  hl("NotifyTRACETitle", { fg = p.magenta_faint })
  hl("NotifyERRORIcon", { fg = s.err })
  hl("NotifyWARNIcon", { fg = s.warning })
  hl("NotifyINFOIcon", { fg = s.info })
  hl("NotifyDEBUGIcon", { fg = p.fg_dim })
  hl("NotifyTRACEIcon", { fg = p.magenta_faint })
end

M.palette = p

M.setup()

return M
