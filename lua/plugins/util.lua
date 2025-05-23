return {
	-- Mini Utils
	{
		"echasnovski/mini.nvim",
		config = function()
			-- Better Around/Inside textobjects
			--
			-- Examples:
			--  - va)  - [V]isually select [A]round [)]paren
			--  - yinq - [Y]ank [I]nside [N]ext [']quote
			--  - ci'  - [C]hange [I]nside [']quote
			require("mini.ai").setup({ n_lines = 500 })

			-- Add/delete/replace surroundings (brackets, quotes, etc.)
			--
			-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
			-- - sd'   - [S]urround [D]elete [']quotes
			-- - sr)'  - [S]urround [R]eplace [)] [']
			require("mini.surround").setup()

			require("mini.comment").setup()
			require("mini.icons").setup({
				opts = {
					file = {
						[".eslintrc.js"] = { glyph = "󰱺", hl = "MiniIconsYellow" },
						[".node-version"] = { glyph = "", hl = "MiniIconsGreen" },
						[".prettierrc"] = { glyph = "", hl = "MiniIconsPurple" },
						[".yarnrc.yml"] = { glyph = "", hl = "MiniIconsBlue" },
						["eslint.config.js"] = { glyph = "󰱺", hl = "MiniIconsYellow" },
						["package.json"] = { glyph = "", hl = "MiniIconsGreen" },
						["tsconfig.json"] = { glyph = "", hl = "MiniIconsAzure" },
						["tsconfig.build.json"] = { glyph = "", hl = "MiniIconsAzure" },
						["yarn.lock"] = { glyph = "", hl = "MiniIconsBlue" },
					},
				},
			})

			require("mini.bufremove").setup()
			local statusline = require("mini.statusline")
			statusline.setup({
				use_icons = true,
				laststatus = 3,
				set_vim_settings = false,
			})

			-- You can configure sections in the statusline by overriding their
			-- default behavior. For example, here we set the section for
			-- cursor location to LINE:COLUMN
			---@diagnostic disable-next-line: duplicate-set-field
			statusline.section_location = function()
				return "%2l:%-2v"
			end
		end,
	},
	-- Markdown
	{
		"OXY2DEV/markview.nvim",
		-- lazy = false,      -- Recommended
		ft = { "markdown", "rmd" },

		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},
	-- Vim Tmux Navigator
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},

	--Python Venv Selector
	{
		"linux-cultist/venv-selector.nvim",
		ft = { "python", "ipynb" },
		dependencies = {
			"neovim/nvim-lspconfig",
			"mfussenegger/nvim-dap",
			"mfussenegger/nvim-dap-python", --optional
			{ "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
		},
		lazy = "VeryLazy",
		branch = "regexp", -- This is the regexp branch, use this for the new version
		config = function()
			require("venv-selector").setup({
				name = { "venv", ".venv", "env", ".env" },
				auto_refresh = false,
				dap_enabled = true,
			})
		end,
		keys = {
			-- Keymap to open VenvSelector to pick a venv.
			{ "<leader>vs", "<cmd>VenvSelect<cr>" },
			-- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
			{ "<leader>vc", "<cmd>VenvSelectCached<cr>" },
		},
	},

	-- ToggleTerm
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({
				open_mapping = [[<C-t>]],
				size = vim.o.columns * 0.4,
				close_on_exit = false,
				shell = vim.o.shell,
				shade_terminals = false,
				direction = "vertical",
			})
			function _G.set_terminal_keymaps()
				local opts = { buffer = 0 }
				-- vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
				-- vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
				vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
				vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
				vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
				vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
				vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
			end

			-- if you only want these mappings for toggle term use term://*toggleterm#* instead
			vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
		end,
	},
}
