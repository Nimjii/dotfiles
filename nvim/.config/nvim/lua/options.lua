-- @module options

vim.o.backspace = 'indent,eol,start'
vim.o.breakindent = true
vim.o.completeopt = 'menuone,noselect'
vim.o.copyindent = true
vim.o.cursorline = true
vim.o.foldcolumn = '0'
vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.mouse = 'a'
vim.o.pumblend = 1
vim.o.scrolloff = 8
vim.o.shiftwidth = 4
vim.o.sidescrolloff = 8
vim.o.smartcase = true
vim.o.softtabstop = 4
vim.o.swapfile = false
vim.o.tabstop = 4
vim.o.termguicolors = true
vim.o.timeoutlen = 500
vim.o.undofile = true
vim.o.updatetime = 250
vim.o.wrap = false

vim.wo.relativenumber= true
vim.wo.signcolumn= 'yes'

vim.g.mapleader = ' '
vim.g.maplocalleader = ','
vim.g.t_ZH = '[3m'
vim.g.t_ZR = '[23m'

-- vim.g.genghis_use_systemclipboard = true
vim.g.gitblame_ignored_filetypes = { "lock" }
vim.g.gitblame_display_virtual_text = 0
vim.g.gitblame_message_template = "<summary> • <date> • <author>"
-- vim.g.mkdp_auto_close = 0
