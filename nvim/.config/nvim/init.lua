-- Dependencies
require 'autocmds'
require 'filetypes'
require 'options'

--[[ Install lazy ]]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

--[[ Install plugins ]]
require('lazy').setup({
  { import = 'plugins' },

  'tpope/vim-fugitive',
  'tpope/vim-sleuth',
}, {})

-- uses which-key so it has to be called after plugins have been installed
require 'mappings'

