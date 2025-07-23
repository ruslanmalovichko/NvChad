require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt ='both' -- to enable cursorline!

-- Включаем бэкапы, undo и swap
vim.opt.backup = true
vim.opt.writebackup = true
vim.opt.undofile = true
vim.opt.backupcopy = "yes"

-- Определяем пути
local config_path = vim.fn.stdpath("config") -- это ~/.config/nvim
local backup_dir = config_path .. "/backup//"
local swap_dir   = config_path .. "/swp//"
local undo_dir   = config_path .. "/undo//"

-- Применяем пути
vim.opt.backupdir = backup_dir
vim.opt.directory = swap_dir
vim.opt.undodir   = undo_dir

vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("CustomBackupExtension", { clear = true }), -- Создаем группу автокоманд
  pattern = "*", -- Применять ко всем файлам
  callback = function()
    -- Получаем текущую дату и время в нужном формате
    local timestamp = vim.fn.strftime("%F.%H:%M:%S")
    -- Устанавливаем буфер-локальную опцию 'bex'
    vim.opt_local.bex = '@' .. timestamp
  end,
  -- Опционально: можно указать буфер, если вам нужно применить это только к конкретному буферу,
  -- но для "*" это не требуется.
  -- buffer = 0, -- 0 означает текущий буфер
})


