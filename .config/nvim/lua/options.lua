vim.g.mapleader = " "

-- Disable builtin file explorer
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- True colors
vim.opt.termguicolors = true

-- Clipboard
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- Tab
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- UI
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.showmode = false

-- Indent
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.linebreak = true
vim.opt.breakindent = true

-- Search
vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Hold cursor position
vim.opt.jumpoptions = "stack,view"

-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Views can only be fully collapsed with the global statusline
vim.opt.laststatus = 3

-- Disable greeter screen
vim.opt.shortmess:append("I")
