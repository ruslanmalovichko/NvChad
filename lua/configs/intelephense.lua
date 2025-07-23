return {
  cmd = { "intelephense", "--stdio" },
  -- filetypes = { "php", "phtml", "module", "inc" },
  filetypes = { "php" },
  root_dir = require("lspconfig.util").root_pattern("composer.json", ".git"),
  -- root_dir = "/media/ruslan/data-encrypted/docker-projects/ptprocover-upgrade-2",
  -- root_markers = { "composer.json", ".git", "vendor/" },
  -- root_markers = { "vendor/" },
  -- root_dir = function(fname)
  --   return "/media/ruslan/data-encrypted/docker-projects/ptprocover-upgrade-2"
  -- end,
  -- on_attach = require("nvchad.configs.lspconfig").on_attach,
  init_options = {
    -- Укажи путь, если хочешь хранить кэш в определённой папке
    -- storagePath = "/tmp/intelephense",
    -- globalStoragePath = "/home/ruslan/.cache/intelephense",
    -- licenceKey = "ваш_лицензионный_ключ" или путь к файлу
    -- clearCache = true,
  },
  settings = {
    intelephense = {
      files = {
        associations = { "*.php", "*.module", "*.inc", "*.install", "*.theme" },
        maxSize = 5000000,
      },
      -- environment = {
      --   documentRoot = "/media/ruslan/data-encrypted/docker-projects/ptprocover-upgrade-2",
      --   includePaths = {
      --     "/media/ruslan/data-encrypted/docker-projects/ptprocover-upgrade-2",
      --     "/media/ruslan/data-encrypted/docker-projects/ptprocover-upgrade-2/html",
      --     "/media/ruslan/data-encrypted/docker-projects/ptprocover-upgrade-2/html/core",
      --     "/media/ruslan/data-encrypted/docker-projects/ptprocover-upgrade-2/html/core/includes",
      --     "/media/ruslan/data-encrypted/docker-projects/ptprocover-upgrade-2/html/core/includes/bootstrap.inc",
      --     "/media/ruslan/data-encrypted/docker-projects/ptprocover-upgrade-2/html/modules",
      --     "/media/ruslan/data-encrypted/docker-projects/ptprocover-upgrade-2/html/themes",
      --     "/media/ruslan/data-encrypted/docker-projects/ptprocover-upgrade-2/vendor",
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
