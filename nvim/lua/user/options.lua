-- Set highlight on search
vim.o.hlsearch = false
vim.o.autowrite = true
vim.o.tabstop = 4

vim.o.mouse = 'a'
vim.o.spell = true
vim.o.confirm = true

vim.o.sidescrolloff = 8
vim.o.scrolloff = 8

vim.o.relativenumber = true
vim.wo.number = true

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set colorscheme
vim.o.termguicolors = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

