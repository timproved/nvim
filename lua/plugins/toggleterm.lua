vim.pack.add({
  { src = "https://github.com/akinsho/toggleterm.nvim" },
})

require("toggleterm").setup({
  cmd = { "ToggleTerm", "TermExec" },
  open_mapping = [[<C-t>]],
  size = 20,
})
