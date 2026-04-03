local registry = require("config.registry")

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("my.lsp", {}),
	callback = function(ev)
		local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))

		local map = vim.keymap.set
		local opts = { buffer = ev.buf, noremap = true, silent = true }

		-- Navigation
		map("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Go to definition" }))
		map("n", "gD", vim.lsp.buf.declaration, vim.tbl_extend("force", opts, { desc = "Go to declaration" }))
		map("n", "gtd", vim.lsp.buf.type_definition, vim.tbl_extend("force", opts, { desc = "Go to type definition" }))
		map("n", "gri", vim.lsp.buf.implementation, vim.tbl_extend("force", opts, { desc = "Go to implementation" }))
		map("n", "grr", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "Go to references" }))

		-- Info
		map("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover documentation" }))
		map({ "n", "i" }, "<C-s>", vim.lsp.buf.signature_help, vim.tbl_extend("force", opts, { desc = "Signature help" }))

		-- Actions
		map("n", "grn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename symbol" }))
		map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code action" }))
		map("n", "<leader>fo", vim.lsp.buf.format, { desc = "[F]ormat" })

		-- Symbols
		map("n", "gO", vim.lsp.buf.document_symbol, vim.tbl_extend("force", opts, { desc = "Document symbols" }))

		-- Inlay hints toggle
		vim.keymap.set("n", "<leader>th", function()
			vim.g.inlay_hints = not vim.g.inlay_hints
			vim.lsp.inlay_hint.enable(vim.g.inlay_hints)
			vim.notify("Inlay hints " .. (vim.g.inlay_hints and "enabled" or "disabled"))
		end, { desc = "Toggle inlay hints" })

		if client:supports_method("textDocument/inlayHint") then
			if vim.g.inlay_hints then
				vim.defer_fn(function()
					if vim.api.nvim_buf_is_valid(ev.buf) then
						vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
					end
				end, 500)
			end

			vim.api.nvim_create_autocmd("InsertEnter", {
				group = vim.api.nvim_create_augroup("my.lsp.inlay_hints", { clear = false }),
				buffer = ev.buf,
				callback = function()
					if vim.g.inlay_hints then
						vim.lsp.inlay_hint.enable(false, { bufnr = ev.buf })
					end
				end,
			})
			vim.api.nvim_create_autocmd("InsertLeave", {
				group = vim.api.nvim_create_augroup("my.lsp.inlay_hints", { clear = false }),
				buffer = ev.buf,
				callback = function()
					if vim.g.inlay_hints then
						vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
					end
				end,
			})
		end

		-- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
		if client:supports_method("textDocument/completion") then
			-- Optional: trigger autocompletion on EVERY keypress. May be slow!
			-- local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
			-- client.server_capabilities.completionProvider.triggerCharacters = chars
			-- vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true }) Disabled in favor for blink
		end
		-- Auto-format ("lint") on save.
		-- Usually not needed if server supports "textDocument/willSaveWaitUntil".
		if
			not client:supports_method("textDocument/willSaveWaitUntil")
			and client:supports_method("textDocument/formatting")
		then
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = vim.api.nvim_create_augroup("my.lsp", { clear = false }),
				buffer = ev.buf,
				callback = function()
					vim.lsp.buf.format({ bufnr = ev.buf, id = client.id, timeout_ms = 1000 })
				end,
			})
		end
	end,
})

vim.lsp.config("*", {
	capabilities = {
		textDocument = {
			semanticTokens = {
				multilineTokenSupport = true,
			},
		},
	},
	root_markers = { ".git" },
})

vim.lsp.enable(registry.servers)
