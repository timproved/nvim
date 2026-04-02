---@brief
--- https://github.com/tailwindlabs/tailwindcss-intellisense
---
--- Tailwind CSS Language Server can be installed via npm:
---
--- npm install -g @tailwindcss/language-server

local config_files = {
	"tailwind.config.js",
	"tailwind.config.cjs",
	"tailwind.config.mjs",
	"tailwind.config.ts",
	"postcss.config.js",
	"postcss.config.cjs",
	"postcss.config.mjs",
	"postcss.config.ts",
}

local function read_package_json(path)
	local ok, lines = pcall(vim.fn.readfile, path)
	if not ok then
		return nil
	end

	local ok_decode, package = pcall(vim.json.decode, table.concat(lines, "\n"))
	if not ok_decode or type(package) ~= "table" then
		return nil
	end

	return package
end

local function has_tailwind_dependency(package)
	local dependencies = type(package.dependencies) == "table" and package.dependencies or {}
	local dev_dependencies = type(package.devDependencies) == "table" and package.devDependencies or {}

	return dependencies.tailwindcss ~= nil or dev_dependencies.tailwindcss ~= nil
end

local function find_tailwind_package_root(path)
	local dir = vim.fs.dirname(path)

	while dir and dir ~= "" do
		local package_json = dir .. "/package.json"
		if vim.uv.fs_stat(package_json) then
			local package = read_package_json(package_json)
			if package and has_tailwind_dependency(package) then
				return dir
			end
		end

		local parent = vim.fs.dirname(dir)
		if not parent or parent == dir then
			return nil
		end

		dir = parent
	end
end

---@type vim.lsp.Config
return {
	cmd = { "tailwindcss-language-server", "--stdio" },
	-- filetypes copied and adjusted from tailwindcss-intellisense
	filetypes = {
		-- html
		"aspnetcorerazor",
		"astro",
		"astro-markdown",
		"blade",
		"clojure",
		"django-html",
		"htmldjango",
		"edge",
		"eelixir", -- vim ft
		"elixir",
		"ejs",
		"erb",
		"eruby", -- vim ft
		"gohtml",
		"gohtmltmpl",
		"haml",
		"handlebars",
		"hbs",
		"html",
		"htmlangular",
		"html-eex",
		"heex",
		"jade",
		"leaf",
		"liquid",
		"markdown",
		"mdx",
		"mustache",
		"njk",
		"nunjucks",
		"php",
		"razor",
		"slim",
		"twig",
		-- css
		"css",
		"less",
		"postcss",
		"sass",
		"scss",
		"stylus",
		"sugarss",
		-- js
		"javascript",
		"javascriptreact",
		"reason",
		"rescript",
		"typescript",
		"typescriptreact",
		-- mixed
		"vue",
		"svelte",
		"templ",
	},
	---@type vim.lsp.settings.tailwindcss
	settings = {
		tailwindCSS = {
			validate = true,
			lint = {
				cssConflict = "warning",
				invalidApply = "error",
				invalidScreen = "error",
				invalidVariant = "error",
				invalidConfigPath = "error",
				invalidTailwindDirective = "error",
				recommendedVariantOrder = "warning",
			},
			classAttributes = {
				"class",
				"className",
				"class:list",
				"classList",
				"ngClass",
			},
			includeLanguages = {
				eelixir = "html-eex",
				elixir = "phoenix-heex",
				eruby = "erb",
				heex = "phoenix-heex",
				htmlangular = "html",
				templ = "html",
			},
		},
	},
	before_init = function(_, config)
		if not config.settings then
			config.settings = {}
		end
		if not config.settings.editor then
			config.settings.editor = {}
		end
		if not config.settings.editor.tabSize then
			config.settings.editor.tabSize = vim.lsp.util.get_effective_tabstop()
		end
	end,
	workspace_required = true,
	root_dir = function(bufnr, on_dir)
		local fname = vim.api.nvim_buf_get_name(bufnr)
		if fname == "" then
			return
		end

		local config_file = vim.fs.find(config_files, { path = fname, upward = true, type = "file", limit = 1 })[1]
		if config_file then
			on_dir(vim.fs.dirname(config_file))
			return
		end

		-- Fallback for Tailwind projects that rely on package.json without a dedicated config file.
		on_dir(find_tailwind_package_root(fname))
	end,
}
