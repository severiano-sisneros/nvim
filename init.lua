-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Enable line numbers and enable relative numbers
vim.o.number = true
vim.cmd("set relativenumber")

-- Tab and indentation settings
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.cmd("colorscheme blue")

-- Keymaps for window navigation
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Install Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = "\\" -- Same for `maplocalleader`

-- Install plugins
require("lazy").setup("plugins")

-- Avoid showing extra messages when using completion
vim.opt.shortmess = vim.opt.shortmess + "c"

-- Setup rustaceanvim
-- Configure on_attach for rustaceanvim
local function on_attach(client, buffer)
    vim.lsp.inlay_hint.enable(true, {buffer})
end

vim.g.rustaceanvim = {
  -- Plugin configuration
  tools = {
  },
  -- LSP configuration
  server = {
    on_attach = on_attach, 
    default_settings = {
      -- rust-analyzer language server configuration
      ['rust-analyzer'] = {
                -- enable clippy on save
        checkOnSave = {
          command = "clippy",
        },
      },
    },
  },
  -- DAP configuration
  dap = {
  },
}


