vim.pack.add({
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvimtools/none-ls.nvim" },
	{ src = "https://github.com/nvimtools/none-ls-extras.nvim" },
})

local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		-- Lua:
		null_ls.builtins.formatting.stylua,
		-- Docker
		null_ls.builtins.diagnostics.hadolint,
		-- Markdown
		null_ls.builtins.diagnostics.markdownlint,
		-- C / CPP
		null_ls.builtins.formatting.clang_format,
		-- Java
		null_ls.builtins.formatting.google_java_format,
		-- Kotlin
		null_ls.builtins.formatting.ktlint,
		null_ls.builtins.diagnostics.ktlint,
	},
})
