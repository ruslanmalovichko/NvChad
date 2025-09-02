require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt = 'both' -- to enable cursorline!

-- Enable backups, undo, and swap
vim.opt.backup = true
vim.opt.writebackup = true
vim.opt.undofile = true
vim.opt.backupcopy = "yes"
-- Define paths
local config_path = vim.fn.stdpath("config") -- this is ~/.config/nvim
local backup_dir = config_path .. "/backup//"
local swap_dir   = config_path .. "/swp//"
local undo_dir   = config_path .. "/undo//"
-- Apply paths
vim.opt.backupdir = backup_dir
vim.opt.directory = swap_dir
vim.opt.undodir   = undo_dir
vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("CustomBackupExtension", { clear = true }), -- Create autocommand group
  pattern = "*", -- Apply to all files
  callback = function()
    -- Get current date and time in required format
    local timestamp = vim.fn.strftime("%F.%H:%M:%S")
    -- Set buffer-local 'bex' option
    vim.opt_local.bex = '@' .. timestamp
  end,
  -- Optionally: you can specify a buffer if you want to apply this only to a specific buffer,
  -- but for "*" this is not required.
  -- buffer = 0, -- 0 means current buffer
})
-- Configure viewoptions to save cursor position and folded blocks
vim.opt.viewoptions = { "cursor", "folds" }
-- Autocommands for saving and restoring view

vim.api.nvim_create_autocmd("BufWinLeave", {
    pattern = "*",
    command = "mkview",
})
vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = "*",
    command = "silent! loadview",
})

