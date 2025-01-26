return {
	{
		"quarto-dev/quarto-nvim",
		ft = { "quarto" },
		dependencies = {
			"jmbuhr/otter.nvim",
		},
		config = function()
			require("quarto").setup({
				debug = false,
				closePreviewOnExit = true,
				lspFeatures = {
					enabled = true,
					chunks = "curly",
					languages = { "r", "python", "julia", "bash", "html" },
					diagnostics = {
						enabled = true,
						triggers = { "BufWritePost" },
					},
					completion = {
						enabled = true,
					},
				},
				codeRunner = {
					enabled = false,
					default_method = nil, -- 'molten' or 'slime'
					ft_runners = {}, -- filetype to runner, ie. `{ python = "molten" }`.
					-- Takes precedence over `default_method`
					never_run = { "yaml" }, -- filetypes which are never sent to a code runner
				},
			})
		end,
	},
	{ -- directly open ipynb files as quarto docuements
		-- and convert back behind the scenes
		"GCBallesteros/jupytext.nvim",
		opts = {
			custom_language_formatting = {
				python = {
					extension = "qmd",
					style = "quarto",
					force_ft = "quarto",
				},
				r = {
					extension = "qmd",
					style = "quarto",
					force_ft = "quarto",
				},
			},
		},
	},
	{
		"jpalardy/vim-slime",
		init = function()
			vim.g.slime_target = "neovim"
			vim.g.slime_python_ipython = 1
			vim.g.slime_dispatch_ipython_pause = 100
			vim.g.slime_cell_delimiter = "#\\s\\=%%"

			vim.cmd([[
      function! _EscapeText_quarto(text)
      if slime#config#resolve("python_ipython") && len(split(a:text,"\n")) > 1
      return ["%cpaste -q\n", slime#config#resolve("dispatch_ipython_pause"), a:text, "--\n"]
      else
      let empty_lines_pat = '\(^\|\n\)\zs\(\s*\n\+\)\+'
      let no_empty_lines = substitute(a:text, empty_lines_pat, "", "g")
      let dedent_pat = '\(^\|\n\)\zs'.matchstr(no_empty_lines, '^\s*')
      let dedented_lines = substitute(no_empty_lines, dedent_pat, "", "g")
      let except_pat = '\(elif\|else\|except\|finally\)\@!'
      let add_eol_pat = '\n\s[^\n]\+\n\zs\ze\('.except_pat.'\S\|$\)'
      return substitute(dedented_lines, add_eol_pat, "\n", "g")
      end
      endfunction
      ]])
		end,
		config = function()
			vim.keymap.set({ "n" }, "<leader>rc", function()
				vim.cmd([[ call slime#send_cell() ]])
			end, { desc = "send code cell to terminal" })
		end,
	},
	{
		"michaelb/sniprun",
		branch = "master",
		build = "sh install.sh",
		-- do 'sh install.sh 1' if you want to force compile locally
		-- (instead of fetching a binary from the github release). Requires Rust >= 1.65

		config = function()
			require("sniprun").setup({
				-- TODO:
				-- 1. Setup Python SnipRun Support in ipynb files
				-- 2. Setup Support for md files
				vim.api.nvim_set_keymap("v", "<leader>rs", "<Plug>SnipRun", { silent = true }),
				vim.api.nvim_set_keymap("n", "<leader>fn", "<Plug>SnipRunOperator", { silent = true }),
				selected_interpreters = { "Python3_jupyter" }, --# use those instead of the default for the current filetype
				repl_enable = {}, --# enable REPL-like behavior for the given interpreters
				repl_disable = {}, --# disable REPL-like behavior for the given interpreters

				interpreter_options = { --# interpreter-specific options, see doc / :SnipInfo <name>

					Python3_jupyter = {
						use_on_filetypes = { "ipynb", "qmd", "quarto" },
					},
					R_original = {
						use_on_filetypes = { "rmd", "r" },
					},
					GFM_original = {
						use_on_filetypes = { "markdown.pandoc" }, --# the 'use_on_filetypes' configuration key is
						--# available for every interpreter
					},
					-- Python3_original = {
					-- 	error_truncate = "auto", --# Truncate runtime errors 'long', 'short' or 'auto'
					-- 	--# the hint is available for every interpreter
					-- 	--# but may not be always respected
					-- },
				},

				--# you can combo different display modes as desired and with the 'Ok' or 'Err' suffix
				--# to filter only sucessful runs (or errored-out runs respectively)
				display = {
					"Classic", --# display results in the command-line  area
					"VirtualTextOk", --# display ok results as virtual text (multiline is shortened)

					-- "VirtualText",             --# display results as virtual text
					-- "TempFloatingWindow",      --# display results in a floating window
					-- "LongTempFloatingWindow",  --# same as above, but only long results. To use with VirtualText[Ok/Err]
					-- "Terminal",                --# display results in a vertical split
					-- "TerminalWithCode",        --# display results and code history in a vertical split
					-- "NvimNotify",              --# display with the nvim-notify plugin
					-- "Api"                      --# return output to a programming interface
				},

				live_display = { "VirtualTextOk" }, --# display mode used in live_mode

				display_options = {
					terminal_scrollback = vim.o.scrollback, --# change terminal display scrollback lines
					terminal_line_number = false, --# whether show line number in terminal window
					terminal_signcolumn = false, --# whether show signcolumn in terminal window
					terminal_position = "vertical", --# or "horizontal", to open as horizontal split instead of vertical split
					terminal_width = 45, --# change the terminal display option width (if vertical)
					terminal_height = 20, --# change the terminal display option height (if horizontal)
					notification_timeout = 5, --# timeout for nvim_notify output
				},

				--# You can use the same keys to customize whether a sniprun producing
				--# no output should display nothing or '(no output)'
				show_no_output = {
					"Classic",
					"TempFloatingWindow", --# implies LongTempFloatingWindow, which has no effect on its own
				},

				--# customize highlight groups (setting this overrides colorscheme)
				--# any parameters of nvim_set_hl() can be passed as-is
				snipruncolors = {
					SniprunVirtualTextOk = { bg = "#66eeff", fg = "#000000", ctermbg = "Cyan", ctermfg = "Black" },
					SniprunFloatingWinOk = { fg = "#66eeff", ctermfg = "Cyan" },
					SniprunVirtualTextErr = { bg = "#881515", fg = "#000000", ctermbg = "DarkRed", ctermfg = "Black" },
					SniprunFloatingWinErr = { fg = "#881515", ctermfg = "DarkRed", bold = true },
				},

				live_mode_toggle = "off", --# live mode toggle, see Usage - Running for more info

				-- miscellaneous compatibility/adjustement settings
				ansi_escape = true, --# Remove ANSI escapes (usually color) from outputs
				inline_messages = false, --# boolean toggle for a one-line way to display output
				--# to workaround sniprun not being able to display anything

				borders = "single", --# display borders around floating windows
				--# possible values are 'none', 'single', 'double', or 'shadow'
			})
		end,
	},
}
