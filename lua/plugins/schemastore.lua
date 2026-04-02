vim.pack.add({
  { src = "https://github.com/b0o/SchemaStore.nvim" },
})

vim.lsp.config("yamlls", {
  settings = {
    yaml = {
      schemas = require("schemastore").yaml.schemas(),
    },
  },
})

vim.lsp.config("json-lsp", {
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
    },
  },
})
