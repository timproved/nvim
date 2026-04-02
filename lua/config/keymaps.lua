local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Tab switching
map("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })

-- Go to different windows
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize windows/buffers with Ctrl+Cmd+arrow keys (macOS)
map("n", "<C-S-Up>", "<cmd>resize +5<CR>", opts)
map("n", "<C-S-Down>", "<cmd>resize -5<CR>", opts)
map("n", "<C-S-Left>", "<cmd>vertical resize -5<CR>", opts)
map("n", "<C-S-Right>", "<cmd>vertical resize +5<CR>", opts)

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- vim.pack keymaps
map("n", "<leader>pu", "<cmd>lua vim.pack.update()<CR>")
map("n", "<leader>pd", function()
vim.ui.input({ prompt = "Plugin name to delete: " }, function(input)
if input and input ~= "" then
pcall(vim.pack.del, { input })
end
end)
end, { desc = "Delete Plugin" })
vim.g.mapleader = " "
-- Move to window using the <ctrl> hjkl keys
vim.keymap.set({ "n" }, "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
vim.keymap.set({ "n" }, "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
vim.keymap.set({ "n" }, "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
vim.keymap.set({ "n" }, "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize window using <ctrl> arrow keys
vim.keymap.set({ "t", "n" }, "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
vim.keymap.set({ "t", "n" }, "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
vim.keymap.set({ "t", "n" }, "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
vim.keymap.set({ "t", "n" }, "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Jump up and down stay centered
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Jump down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Jump up" })
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
--yank that shit
vim.keymap.set("n", "<leader>y", '"+y', { desc = "Yank to clipboard" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank to clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "Yank to clipboard" })
--VSWho?
vim.keymap.set("n", "<leader>rs", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace" })
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
--Buffers
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<C-c>", function()
	require("mini.bufremove").delete()
end, { desc = "Delete Buffer" })
--Terminal Navigation
vim.keymap.set("t", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
vim.keymap.set("t", "<C-j>", "<C-w>j", { desc = "Go to Down Window", remap = true })
vim.keymap.set("t", "<C-k>", "<C-w>k", { desc = "Go to Up Window", remap = true })
vim.keymap.set("t", "<C-l>", "<C-w>j", { desc = "Go to Right Window", remap = true })
--Disabling stuff
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')
--vim.keymap.set("n", "<S-k>", '<cmd>echo "wrong!"<CR>')
vim.keymap.set("n", "<S-j>", '<cmd>echo "wrong!"<CR>')

-- Show all diagnostics on current line in floating window
vim.keymap.set("n", "<leader>q", ":lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })
-- Go to next diagnostic (if there are multiple on the same line, only shows
-- one at a time in the floating window)
vim.keymap.set("n", "<Leader>n", ":lua vim.diagnostic.goto_next()<CR>", { noremap = true, silent = true })
-- Go to prev diagnostic (if there are multiple on the same line, only shows
-- one at a time in the floating window)
vim.keymap.set("n", "<Leader>p", ":lua vim.diagnostic.goto_prev()<CR>", { noremap = true, silent = true })
