vim.pack.add({
  { src = "https://github.com/mrcjkb/rustaceanvim", version = "v8.0.5" },
  { src = "https://github.com/saecki/crates.nvim" },
})

-- TODO: Fix Rust analyzer

require("crates").setup({
  completion = {
    crates = {
      enabled = true,
    },
  },
  lsp = {
    enabled = true,
    actions = true,
    completion = true,
    hover = true,
  },
})
