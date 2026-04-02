vim.pack.add({
  { src = "https://github.com/folke/which-key.nvim" },
})

require("which-key").setup({
  spec = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
})
