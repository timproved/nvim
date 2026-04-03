vim.cmd.packadd("nvim.undotree")

vim.keymap.set("n", "<leader>u", function()
	vim.cmd.packadd("nvim.undotree")
	require("undotree").open({
		command = "topleft 30vnew",
	})
end, { desc = "Open undo tree" })
