return {
	-- -- Bufferline
	-- {
	-- 	"akinsho/bufferline.nvim",
	-- 	version = "*",
	-- 	dependencies = "nvim-tree/nvim-web-devicons",
	-- 	config = function()
	-- 		require("bufferline").setup({
	-- 			options = {
	-- 				mode = "buffers", -- set to "tabs" to only show tabpages instead
	-- 				themable = false, -- allows highlight groups to be overriden i.e. sets highlights as default
	-- 				numbers = "none",
	-- 				indicator = {
	-- 					icon = "▎", -- this should be omitted if indicator style is not 'icon'
	-- 					style = "icon",
	-- 				},
	-- 				buffer_close_icon = "󰅖",
	-- 				modified_icon = "●",
	-- 				close_icon = "",
	-- 				left_trunc_marker = "",
	-- 				right_trunc_marker = "",
	-- 				--- name_formatter can be used to change the buffer's label in the bufferline.
	-- 				--- Please note some names can/will break the
	-- 				--- bufferline so use this at your discretion knowing that it has
	-- 				--- some limitations that will *NOT* be fixed.
	-- 				name_formatter = function(buf) -- buf contains:
	-- 					-- name                | str        | the basename of the active file
	-- 					-- path                | str        | the full path of the active file
	-- 					-- bufnr (buffer only) | int        | the number of the active buffer
	-- 					-- buffers (tabs only) | table(int) | the numbers of the buffers in the tab
	-- 					-- tabnr (tabs only)   | int        | the "handle" of the tab, can be converted to its ordinal number using: `vim.api.nvim_tabpage_get_number(buf.tabnr)`
	-- 				end,
	-- 				max_name_length = 18,
	-- 				max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
	-- 				truncate_names = true, -- whether or not tab names should be truncated
	-- 				tab_size = 18,
	-- 				diagnostics = "nvim_lsp", -- "nvim_lsp", "coc", "ale", "or null" so
	-- 				-- diagnostics_update_in_insert = "",
	-- 				-- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
	-- 				diagnostics_indicator = function(count, level, diagnostics_dict, context)
	-- 					local icon = level:match("error") and " " or " "
	-- 					return " " .. icon .. count
	-- 				end,
	-- 				-- NOTE: this will be called a lot so don't do any heavy processing here
	-- 				custom_filter = function(buf_number, buf_numbers)
	-- 					-- filter out filetypes you don't want to see
	-- 					if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
	-- 						return true
	-- 					end
	-- 					-- filter out by buffer name
	-- 					if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
	-- 						return true
	-- 					end
	-- 					-- filter out based on arbitrary rules
	-- 					-- e.g. filter out vim wiki buffer from tabline in your work repo
	-- 					if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
	-- 						return true
	-- 					end
	-- 					-- filter out by it's index number in list (don't show first buffer)
	-- 					if buf_numbers[1] ~= buf_number then
	-- 						return true
	-- 					end
	-- 				end,
	-- 				offsets = {
	-- 					{
	-- 						filetype = "neo-tree",
	-- 						text = "Neo-Tree", -- | function ,
	-- 						highlight = "Directory",
	-- 						text_align = "left", -- | "center" | "right"
	-- 						separator = true,
	-- 					},
	-- 				},
	-- 				color_icons = true,
	-- 				get_element_icon = function(element)
	-- 					-- element consists of {filetype: string, path: string, extension: string, directory: string}
	-- 					-- This can be used to change how bufferline fetches the icon
	-- 					-- for an element e.g. a buffer or a tab.
	-- 					-- e.g.
	-- 					local icon, hl =
	-- 						require("nvim-web-devicons").get_icon_by_filetype(element.filetype, { default = false })
	-- 					return icon, hl
	-- 				end,
	-- 				show_buffer_icons = true, -- disable filetype icons for buffers
	-- 				show_buffer_close_icons = true,
	-- 				show_close_icon = true,
	-- 				show_tab_indicators = true,
	-- 				show_duplicate_prefix = true, -- | false, -- whether to show duplicate buffer prefix
	-- 				duplicates_across_groups = true, -- whether to consider duplicate paths in different groups as duplicates
	-- 				persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
	-- 				move_wraps_at_ends = false, -- whether or not the move command "wraps" at the first or last position
	-- 				-- can also be a table containing 2 custom separators
	-- 				-- [focused and unfocused]. eg: { '|', '|' }
	-- 				separator_style = "thick", -- | "slope" | "thick" | "thin" | { "any", "any" },
	-- 				enforce_regular_tabs = false,
	-- 				always_show_bufferline = true,
	-- 				auto_toggle_bufferline = true,
	-- 				hover = {
	-- 					enabled = true,
	-- 					delay = 200,
	-- 					reveal = { "close" },
	-- 				},
	-- 				sort_by = "insert_at_end",
	-- 				-- | "insert_at_end"
	-- 				-- | "id"
	-- 				-- | "extension"
	-- 				-- | "relative_directory"
	-- 				-- | "directory"
	-- 				-- | "tabs"
	-- 				-- | function(buffer_a, buffer_b)
	-- 				-- 	-- add custom logic
	-- 				-- 	return buffer_a.modified > buffer_b.modified
	-- 				-- end,
	-- 			},
	-- 		})
	-- 	end,
	-- },

	-- Inent Blank Line
	{
		"lukas-reineke/indent-blankline.nvim",
		-- Enable `lukas-reineke/indent-blankline.nvim`
		-- See `:help ibl`
		config = function()
			require("ibl").setup()
		end,
	},

	--Neotree File Tree
	-- {
	-- 	"nvim-neo-tree/neo-tree.nvim",
	-- 	branch = "v3.x",
	-- 	cmd = "Neotree",
	-- 	keys = {
	-- 		{ "\\", ":Neotree reveal<CR>", { desc = "NeoTree reveal" } },
	-- 	},
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
	-- 		"MunifTanjim/nui.nvim",
	-- 		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	-- 	},
	-- 	config = function()
	-- 		vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
	-- 		vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
	-- 		vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
	-- 		vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })
	--
	-- 		require("neo-tree").setup({
	-- 			print("FOOBAR"),
	-- 			close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
	-- 			popup_border_style = "rounded",
	-- 			enable_git_status = true,
	-- 			enable_diagnostics = true,
	-- 			open_files_do_not_replace_types = { "terminal", "trouble", "qf" }, -- when opening files, do not use windows containing these filetypes or buftypes
	-- 			default_component_configs = {
	-- 				icon = {
	-- 					folder_closed = "",
	-- 					folder_open = "",
	-- 					folder_empty = "󰜌",
	-- 					default = "*",
	-- 					highlight = "NeoTreeFileIcon",
	-- 				},
	-- 				modified = {
	-- 					symbol = "[+]",
	-- 					highlight = "NeoTreeModified",
	-- 				},
	-- 				name = {
	-- 					trailing_slash = false,
	-- 					use_git_status_colors = true,
	-- 					highlight = "NeoTreeFileName",
	-- 				},
	-- 				git_status = {
	-- 					symbols = {
	-- 						-- Change type
	-- 						added = "✚",
	-- 						modified = "",
	-- 						deleted = "✖", -- this can only be used in the git_status source
	-- 						renamed = "󰁕", -- this can only be used in the git_status source
	-- 						-- Status type
	-- 						untracked = "",
	-- 						ignored = "",
	-- 						unstaged = "󰄱",
	-- 						staged = "",
	-- 						conflict = "",
	-- 					},
	-- 				},
	-- 			},
	-- 			commands = {},
	-- 			window = {
	-- 				position = "left",
	-- 				width = 40,
	-- 				mappings = {
	-- 					["\\"] = "close_window",
	-- 				},
	-- 			},
	-- 			filesystem = {
	-- 				filtered_items = {
	-- 					visible = false, -- when true, they will just be displayed differently than normal items
	-- 					hide_dotfiles = true,
	-- 					hide_gitignored = true,
	-- 					hide_hidden = true, -- only works on Windows for hidden files/directories
	-- 					window = {
	-- 						mappings = {},
	-- 					},
	-- 				},
	-- 			},
	-- 		})
	-- 	end,
	-- },

	--UndoTree
	{
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle undotree" })
		end,
	},

	-- Better Vim Ui
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			bigfile = { enabled = true },
			dashboard = { enabled = false },
			explorer = { enabled = true },
			indent = { enabled = true },
			input = { enabled = true },
			picker = { enabled = true },
			notifier = { enabled = false },
			quickfile = { enabled = true },
			scope = { enabled = true },
			scroll = { enabled = false },
			statuscolumn = { enabled = true },
			words = { enabled = true },
		},
	},

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
}
