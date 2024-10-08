return {
	{
		"R-nvim/R.nvim",
		ft = { "r", "rmd" },
		lazy = false,
		version = "~0.1.0",
		config = function()
			local opts = {
				hook = {
					on_filetype = function()
						vim.keymap.set("n", "<Enter>", "<Plug>RDSendLine", { buffer = true })
						vim.keymap.set("v", "<Enter>", "<Plug>RSendSelection", { buffer = true })
						local wk = require("which-key")
						wk.add({
							buffer = true,
							{ "<localleader>a", group = "all" },
							{ "<localleader>b", group = "between marks" },
							{ "<localleader>c", group = "chunks" },
							{ "<localleader>f", group = "functions" },
							{ "<localleader>g", group = "goto" },
							{ "<localleader>i", group = "install" },
							{ "<localleader>k", group = "knit" },
							{ "<localleader>p", group = "paragraph" },
							{ "<localleader>q", group = "quarto" },
							{ "<localleader>r", group = "r general" },
							{ "<localleader>s", group = "split or send" },
							{ "<localleader>t", group = "terminal" },
							{ "<localleader>v", group = "view" },
						})
					end,
				},
				R_args = { "--quiet", "--no-save" },
				pdfviewer = "",
				-- external_term = "tmux split-window -h -l 80",
				-- auto_quit = true,
				min_editor_width = 72,
				rconsole_width = 78,
			}
			-- Check if the environment variable "R_AUTO_START" exists.
			-- If using fish shell, you could put in your config.fish:
			-- alias r "R_AUTO_START=true nvim"
			if vim.env.R_AUTO_START == "true" then
				opts.auto_start = "on startup"
				opts.objbr_auto_start = true
			end
			require("r").setup(opts)
		end,
	},
	{
		"R-nvim/cmp-r",
		{
			"hrsh7th/nvim-cmp",
			config = function()
				require("cmp").setup({ sources = { { name = "cmp_r" } } })
				require("cmp_r").setup({})
			end,
		},
	},
}
