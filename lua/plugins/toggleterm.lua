vim.pack.add({
  { src = "https://github.com/akinsho/toggleterm.nvim" },
})

require("toggleterm").setup({
  cmd = { "ToggleTerm", "TermExec" },
  open_mapping = [[<C-t>]],
  size = 15,
})

local group = vim.api.nvim_create_augroup("toggleterm-keymaps", { clear = true })
local function set_terminal_keymaps()
  local opts = { buffer = 0 }
  -- vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
  -- vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

vim.api.nvim_create_autocmd("TermOpen", {
  group = group,
  pattern = "term://*",
  callback = set_terminal_keymaps,
})
