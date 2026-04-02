vim.pack.add({
  {
    src = "https://github.com/saghen/blink.cmp",
    version = vim.version.range("^1"),
  },
  { src = "https://github.com/rafamadriz/friendly-snippets" },
})

require("blink.cmp").setup({
  keymap = {
    preset = "default",
  },
  appearance = {
    nerd_font_variant = "mono",
  },
  completion = { documentation = { auto_show = false } },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },

  fuzzy = { implementation = "prefer_rust_with_warning" },

  -- Shows a signature help window while you type arguments for a function
  signature = { enabled = true }
})

local M = {}

M.capabilities = require("blink.cmp").get_lsp_capabilities()

return M
