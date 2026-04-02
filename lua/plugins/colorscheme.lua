vim.pack.add({
  { src = "https://github.com/slugbyte/lackluster.nvim" },
})

require("lackluster").setup()
vim.cmd.colorscheme("lackluster-hack")
