vim.pack.add({
  'https://github.com/MeanderingProgrammer/render-markdown.nvim',
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/nvim-mini/mini.nvim',  -- if you use the mini.nvim suite
  'https://github.com/nvim-mini/mini.icons', -- if you use standalone mini plugins
})




require('render-markdown').setup({
  completions = { lsp = { enabled = true } },
  code = {
    sign = false,
    width = "block",
    right_pad = 1,
  },
  heading = {
    sign = false,
    icons = {},
  },
  checkbox = {
    enabled = false,
  },
  ft = { "markdown", "norg", "rmd", "org", "codecompanion" },
})
