require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt = 'both' -- enable cursorline in both number and text columns


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
  group = vim.api.nvim_create_augroup("CustomBackupExtension", { clear = true }), -- autocommand group for backup extension
  pattern = "*", -- apply to all files
  callback = function()
    -- Get current date and time in required format
    local timestamp = vim.fn.strftime("%F.%H:%M:%S")
    -- Set buffer-local 'bex' option (used in backup file name)

    vim.opt_local.bex = '@' .. timestamp
  end,
  -- Optionally: you can specify a buffer if you want to apply this only to a specific buffer,
  -- but for "*" this is not required.
  -- buffer = 0, -- 0 means current buffer
})
-- Configure viewoptions to save cursor position and folded blocks
vim.opt.viewoptions = { "cursor", "folds" }
-- Autocommands for saving and restoring view (cursor, folds) only for normal file buffers

local view_group = vim.api.nvim_create_augroup("CustomAutoView", { clear = true })

vim.api.nvim_create_autocmd("BufWinLeave", {
  group = view_group,
  callback = function(args)
    local buf = args.buf

    -- only normal file buffers
    if vim.bo[buf].buftype ~= "" then
      return
    end

    -- buffer must have a file name
    local name = vim.api.nvim_buf_get_name(buf)
    if not name or name == "" then
      return
    end

    vim.cmd("silent! mkview")
  end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
  group = view_group,
  callback = function(args)
    local buf = args.buf

    -- only normal file buffers
    if vim.bo[buf].buftype ~= "" then
      return
    end

    -- buffer must have a file name
    local name = vim.api.nvim_buf_get_name(buf)
    if not name or name == "" then
      return
    end

    vim.cmd("silent! loadview")
  end,
})

