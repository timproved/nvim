local M = {}

-- Lsp Servers that will be enabled via vim.lsp.enable
M.servers = {
  -- Lua
  "lua_ls",
  "stylua",
  -- CPP
  "clangd",
  -- Kotlin
  "kotlin_lsp",
  -- "Python"
  "pyright",
  "ty",
  "ruff",
  -- Typescript
  "vtsls",
  "biome",
  -- Docker
  "dockerls",
  "docker_language_server",
  -- Misc
  "lemminx",
  "bashls",
  "tailwindcss",
  "marksman",
  "json-lsp",
  "yamlls",
  -- "nginx_language_server", -- This is not available for python 3.13, thus skipping for now
  -- Java
  "jdtls",
  -- COBOL
  "cobol_ls",
  -- Academic
  "texlab",
  "tinymist",
}

-- Mason overrides, if the lsp is called differently in the registry
M.mason_overrides = {
  -- Lua
  lua_ls = "lua-language-server",
  -- Kotlin
  kotlin_lsp = "kotlin-lsp",
  bashls = "bash-language-server",
  yamlls = "yaml-language-server",
  tailwindcss = "tailwindcss-language-server",
  cobol_ls = "cobol-language-support",
  dockerls = "dockerfile-language-server",
  docker_language_server = "docker-language-server",
  nginx_language_server = "nginx-language-server",
}

-- Extra tools, Linters, Formatters, etc.
M.extra_tools = {
  -- CPP
  "clang-format",
  -- Java (jdtls moved to servers)
  "java-debug-adapter",
  "java-test",
  "google-java-format",
  -- Rust
  "rust-analyzer",
  -- Kotlin
  "ktlint",
  -- Markdown
  "markdownlint",
  -- Misc
  "hadolint",
}

return M
