vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects" },
})

require('nvim-treesitter').setup {
  -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
  install_dir = vim.fn.stdpath('data') .. '/site'
}

require("nvim-treesitter").setup({})
require("nvim-treesitter").install({
	"bash",
	"c",
  "cpp",
	"css",
	"diff",
	"dockerfile",
	"gitcommit",
	"gitignore",
	"html",
  "java",
	"javascript",
	"jsdoc",
	"json",
  "kotlin",
	"lua",
	"luadoc",
	"make",
	"markdown",
	"markdown_inline",
	"nginx",
	"python",
	"query",
	"regex",
	"rust",
	"scss",
	"sql",
	"terraform",
	"toml",
	"tsx",
	"typescript",
	"vim",
	"vimdoc",
	"xml",
	"yaml",
})

