vim.pack.add({
  { src = "https://github.com/mfussenegger/nvim-jdtls" },
})

local home = os.getenv("HOME")
local mason_share = home .. "/.local/share/nvim/mason/share"
local mason_packages = home .. "/.local/share/nvim/mason/packages"

local function get_bundles()
  local bundles = {
    vim.fn.glob(mason_share .. "/java-debug-adapter/com.microsoft.java.debug.plugin.jar", true),
  }
  local java_test_jars = vim.split(vim.fn.glob(mason_share .. "/java-test/*.jar", true), "\n")
  local excluded = {
    "com.microsoft.java.test.runner-jar-with-dependencies.jar",
    "jacocoagent.jar",
  }
  for _, jar in ipairs(java_test_jars) do
    if jar ~= "" and not vim.tbl_contains(excluded, vim.fn.fnamemodify(jar, ":t")) then
      table.insert(bundles, jar)
    end
  end
  return bundles
end

vim.lsp.config("jdtls", {
  cmd = {
    "jdtls",
    "--jvm-arg=-javaagent:" .. mason_packages .. "/jdtls/lombok.jar",
  },
  root_markers = {
    ".git",
    "mvnw",
    "gradlew",
    "pom.xml",
    "build.gradle",
  },
  settings = {
    java = {
      eclipse = { downloadSources = true },
      configuration = {
        updateBuildConfiguration = "interactive",
        runtimes = {
          {
            name = "JavaSE-21",
            path = home .. "/.sdkman/candidates/java/current/",
          },
        },
      },
      maven = { downloadSources = true },
      referencesCodeLens = { enabled = true },
      references = { includeDecompiledSources = true },
      inlayHints = { parameterNames = { enabled = "all" } },
      format = { enabled = true },
      signatureHelp = { enabled = true },
      saveActions = {
        organizeImports = true,
      },
      completion = {
        favoriteStaticMembers = {
          "org.hamcrest.MatcherAssert.assertThat",
          "org.hamcrest.Matchers.*",
          "org.hamcrest.CoreMatchers.*",
          "org.junit.jupiter.api.Assertions.*",
          "java.util.Objects.requireNonNull",
          "java.util.Objects.requireNonNullElse",
          "org.mockito.Mockito.*",
        },
        importOrder = { "java", "javax", "com", "org" },
      },
    },
  },
  init_options = {
    bundles = get_bundles(),
  },
})
