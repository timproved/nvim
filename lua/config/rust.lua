vim.g.rustaceanvim = function()
  ---@type rustaceanvim.Opts
  return {
    server = {
      cmd = function()
        local ok_registry, mason_registry = pcall(require, "mason-registry")
        if ok_registry and mason_registry.is_installed("rust-analyzer") then
          local install_path = vim.fn.stdpath("data") .. "/mason/packages/rust-analyzer"
          local ra = mason_registry.get_package("rust-analyzer")
          local receipt = ra:get_receipt()
          local ra_filename = "rust-analyzer"

          if receipt:is_present() then
            local links = receipt:get():get_links().bin or {}
            ra_filename = links["rust-analyzer"] or ra_filename
          end

          return { ("%s/%s"):format(install_path, ra_filename) }
        end

        return { "rust-analyzer" }
      end,
      default_settings = {
        ["rust-analyzer"] = {
          cargo = {
            allFeatures = true,
            loadOutDirsFromCheck = true,
            buildScripts = {
              enable = true,
            },
          },
          checkOnSave = true,
          procMacro = {
            enable = true,
            ignored = {
              ["async-trait"] = { "async_trait" },
              ["napi-derive"] = { "napi" },
              ["async-recursion"] = { "async_recursion" },
            },
          },
        },
      },
    },
  }
end
