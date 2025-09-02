local lspconfig = require "lspconfig"

return function(on_attach, capabilities)
  lspconfig.omnisharp.setup {
    cmd = {
      vim.fn.stdpath('data') .. "/mason/packages/omnisharp/OmniSharp",
      "-z",
      "--hostPID",
      tostring(vim.fn.getpid()),
      "DotNet:enablePackageRestore=false",
      "--encoding",
      "utf-8",
      "--languageserver",
    },
    filetypes = { "cs", "vb" },
    root_dir = lspconfig.util.root_pattern("*.sln", "*.csproj", ".git"),
    on_attach = on_attach,
    capabilities = capabilities,
    -- settings = {
    --   FormattingOptions = {
    --     EnableEditorConfigSupport = true,
    --   },
    --   Sdk = {
    --     IncludePrereleases = true,
    --   },
    -- },
    settings = {
      FormattingOptions = {
        EnableEditorConfigSupport = true,
      },
      Sdk = {
        IncludePrereleases = true,
      },
      -- RoslynExtensionsOptions = {
      --   EnableAnalyzersSupport = true,
      --   EnableDecompilationSupport = true,
      --   EnableImportCompletion = true,
      --   EnableEditorConfigSupport = true,
      -- },
    },
  }
end

