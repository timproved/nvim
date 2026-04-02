local registry = require("config.registry")


vim.pack.add({
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" }
})

require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

local function build_ensure_installed()
  local ensure_installed = {}
  local seen = {}

  local function append_unique(package)
    if seen[package] then
      return
    end

    seen[package] = true
    table.insert(ensure_installed, package)
  end

  for _, server in ipairs(registry.servers) do
    append_unique(registry.mason_overrides[server] or server)
  end

  for _, tool in ipairs(registry.extra_tools) do
    append_unique(tool)
  end

  return ensure_installed
end

local ensure_installed = build_ensure_installed()

require('mason-tool-installer').setup {
  ensure_installed = ensure_installed,
  auto_update = false,
  run_on_start = true,
  start_delay = 3000, -- 3 second delay
  debounce_hours = 0, -- at least 5 hours between attempts to install/update
}
