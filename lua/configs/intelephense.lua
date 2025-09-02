return {
  cmd = { "intelephense", "--stdio" },
  -- filetypes = { "php", "phtml", "module", "inc" },
  filetypes = { "php" },
  root_dir = require("lspconfig.util").root_pattern("composer.json", ".git"),
  -- root_dir = "/media/ruslan/data-encrypted/docker-projects/test",
  -- root_markers = { "composer.json", ".git", "vendor/" },
  -- root_markers = { "vendor/" },
  -- root_dir = function(fname)
  --   return "/media/ruslan/data-encrypted/docker-projects/test"
  -- end,
  -- on_attach = require("nvchad.configs.lspconfig").on_attach,
  init_options = {
    -- Specify the path if you want to store the cache in a specific folder
    -- storagePath = "/tmp/intelephense",
    -- globalStoragePath = "/home/ruslan/.cache/intelephense",
    -- licenceKey = "your_license_key" or path to the file
    -- clearCache = true,
  },
  settings = {
    intelephense = {
      files = {
        associations = { "*.php", "*.module", "*.inc", "*.install", "*.theme" },
        maxSize = 5000000,
      },
      -- environment = {
      --   documentRoot = "/media/ruslan/data-encrypted/docker-projects/test",
      --   includePaths = {
      --     "/media/ruslan/data-encrypted/docker-projects/test",
      --     "/media/ruslan/data-encrypted/docker-projects/test/html",
      --     "/media/ruslan/data-encrypted/docker-projects/test/html/core",
      --     "/media/ruslan/data-encrypted/docker-projects/test/html/core/includes",
      --     "/media/ruslan/data-encrypted/docker-projects/test/html/core/includes/bootstrap.inc",
      --     "/media/ruslan/data-encrypted/docker-projects/test/html/modules",
      --     "/media/ruslan/data-encrypted/docker-projects/test/html/themes",
      --     "/media/ruslan/data-encrypted/docker-projects/test/vendor",
      --     "core/",
      --     "core/includes",
      --     "../vendor/"
      --   },
      -- },
      telemetry = {
        enabled = false,
      },
      completion = {
        fullyQualifyGlobalConstantsAndFunctions = false,
      },
      diagnostics = {
        undefinedTypes = false,
      },
    },
  },
}
