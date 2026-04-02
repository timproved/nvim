vim.pack.add({
	{ src = "https://github.com/norcalli/nvim-colorizer.lua" },
})

require("colorizer").setup({
	"css",
	"javascript",
	"javascript.jsx",
	"javascriptreact",
	"typescript",
	"typescriptreact",
	"typescript.tsx",
	html = {
		mode = "foreground",
	},
})
