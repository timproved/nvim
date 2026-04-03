# Neovim Config for neovim >= v0.12.0

This is my personal neovim config for neovim v0.12.0.

It is utilizing the new vim.pack.add() command for all plugin installs,
as well as the vim.lsp.config() command for configuring all LSPs
(no more nvim-lspconfig needed)!

I deliberately refrained from using the builtin completions for now,
since I still like blink.cmp's capabilities better.

Since this is using the main branch of treesitter
you will have to install the tree-sitter-cli

```bash
sudo pacman -S tree-sitter-cli
```

## Decisions / Design Choices

### Facilitate installing LSPs, formatters and linters through mason and the mason-tool-installer

Installing tools via mason and enabling lsp's is happening
through a single lua file:

```lua
local M = {}
-- Lsp Servers that will be enabled via vim.lsp.enable
M.servers = {
	"lua_ls",
}
-- Mason overrides, if the lsp is called differently in the registry
M.mason_overrides = {
	lua_ls = "lua-language-server",
}
-- Extra tools, Linters, Formatters, etc.
M.extra_tools = {
	"stylua",
}
return M
```

- **servers** are the language servers that are going to be enabled via vim.lsp.enable in lsp.lua
- **mason_overrides** are for naming mismatches between the server and the package in the mason repositories
- **extra_tools** are for tools that should be installed via mason, but not enabled via vim.lsp.enable

### Since I don't use nvim-lspconfig I placed all lsp-config files in the lsp/ directory.

This was especially useful, since vim.lsp.util does have a different api than require("nvim-lspconfig").util

### There are no dependencies between lua.config and lua.plugins packages

Since blink.cmp implicitly registers its capabilities, there is no need to call 

```lua
local capabilites = require("blink.cmp").get_lsp_capabilities()
```

in lsp.lua

### Each plugin (mostly) lives in its own lua file and gets required in plugins.init.lua

The only exceptions to this is git.lua as well as dependencies and functionally related plugins in telescope.lua for example


### For all of the mason packages to install properly one will need the following dependencies:

```bash
sudo pacman -S zip npm cargo python3 

```
