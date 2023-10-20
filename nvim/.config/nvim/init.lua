-- Dependencies
require 'autocmds'
require 'filetypes'

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require('lazy').setup({
  { import = 'plugins' },

  'tpope/vim-fugitive',
  'tpope/vim-sleuth',

  {
    'nvim-tree/nvim-web-devicons',
    opts = {
      override = {
        tsconfig = {
          icon = '',
          color = '#8c8c8c',
          name = 'TSconfig',
        },
        typoscript = {
          icon = '',
          color = '#FF8700',
          name = 'TypoScript',
        },
      },
    },
  },

  -- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },

  {
    'declancm/maximize.nvim',
    opts = {
      default_keymaps = false,
    },
    keys = {
      { '<leader>z', mode = 'n', function () require('maximize').toggle() end, desc = 'Toggle split maximization' },
    },
  },

  {
    'numToStr/Comment.nvim',
    config = function ()
      require('Comment').setup()
    end,
  },

  {
    'iamcco/markdown-preview.nvim',
    build = 'cd app && npm install',
    ft = 'markdown',
    keys = {
      { '<leader>Fp', mode = { 'n' }, '<cmd>MarkdownPreviewToggle<cr>', desc = 'Markdown preview' },
    },
  },
}, {})

--[[ Setting options ]]

--See `:help vim.o`
vim.o.autoindent = true
vim.o.backspace = 'indent,eol,start'
vim.o.breakindent = true
vim.o.cindent = true
vim.o.completeopt = 'menuone,noselect'
vim.o.copyindent = true
vim.o.cursorline = true
vim.o.foldcolumn = '0'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.mouse = 'a'
vim.o.pumblend = 1
vim.o.scrolloff = 8
vim.o.shiftwidth = 4
vim.o.smartcase = true
vim.o.softtabstop = 4
vim.o.tabstop = 4
vim.o.termguicolors = true
vim.o.timeoutlen = 500
vim.o.undofile = true
vim.o.updatetime = 250
vim.o.wrap = false

vim.wo.relativenumber= true
vim.wo.signcolumn= 'yes'

vim.g.t_ZH = '[3m'
vim.g.t_ZR = '[23m'

vim.g.gitblame_ignored_filetypes = { "lock" }
vim.g.gitblame_display_virtual_text = 0
vim.g.gitblame_message_template = "<summary> • <date> • <author>"
vim.g.mkdp_auto_close = 0

-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<C-f>', '<C-f>zz', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<C-b>', '<C-b>zz', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<C-d>', '<C-d>zz', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<C-u>', '<C-u>zz', { silent = true })
vim.keymap.set({ 'n' }, 'n', 'nzzzv', { silent = true })
vim.keymap.set({ 'n' }, 'N', 'Nzzzv', { silent = true })
vim.keymap.set({ 'n', 'v' }, 'x', '"_x', { desc = 'Delete character', silent = true })
vim.keymap.set({ 'n' }, '<C-h>', '<C-w>h', { desc = 'Move to left split' })
vim.keymap.set({ 'n' }, '<C-j>', '<C-w>j', { desc = 'Move to below split' })
vim.keymap.set({ 'n' }, '<C-k>', '<C-w>k', { desc = 'Move to above split' })
vim.keymap.set({ 'n' }, '<C-l>', '<C-w>l', { desc = 'Move to right split' })
vim.keymap.set({ 'n' }, '<C-Up>', '<cmd>resize -2<CR>', { desc = 'Resize split up' })
vim.keymap.set({ 'n' }, '<C-Down>', '<cmd>resize +2<CR>', { desc = 'Resize split down' })
vim.keymap.set({ 'n' }, '<C-Left>', '<cmd>vertical resize -2<CR>', { desc = 'Resize split left' })
vim.keymap.set({ 'n' }, '<C-Right>', '<cmd>vertical resize +2<CR>', { desc = 'Resize split right' })
vim.keymap.set({ 'n' }, '<C-s>', '<C-w>s', { desc = 'Create horizontal split' })
vim.keymap.set({ 'n' }, '<C-m>', '<C-w>v', { desc = 'Create vertical split' })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Navigation mappings
vim.keymap.set('n', ']t', function () vim.cmd.tabnext() end, { desc = 'Next tab' })
vim.keymap.set('n', '[t', function () vim.cmd.tabprevious() end, { desc = 'Previous tab' })

-- Mapping groups
require('which-key').register({
  a = { name = '󰫍 Annotations' },
  d = { name = ' Debugger' },
  f = { name = '󰍉 Find' },
  F = { name = ' Files' },
  g = { name = '󰛢 Grapple' },
  G = { name = ' Git blame' },
  h = { name = ' Hunk Actions' },
  n = { name = '󱚌 Neorg' },
  p = { name = ' Portal' },
  Q = { name = ' Quickfix' },
  t = { name = ' ToggleTerm' },
}, { prefix = '<leader>' })

-- Buffer mappings
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>', { desc = 'Save' })
vim.keymap.set('n', '<leader>q', '<cmd>confirm q<cr>', { desc = 'Quit' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>m', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })

-- Snippet keymaps
vim.keymap.set('n', '<Tab>', function () require('luasnip').jump(1) end, { silent = true })
vim.keymap.set('n', '<S-Tab>', function () require('luasnip').jump(-1) end, { silent = true })

-- [[ Configure LSP ]]
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  require('which-key').register({
    l = {
      name = '󰚔 LSP',
      r = { vim.lsp.buf.rename, 'Rename symbol' },
      a = { vim.lsp.buf.code_action, 'Code action' },
      f = { vim.lsp.buf.format, 'Format buffer' },
      s = { function() require('aerial').nav_toggle() end, 'Symbols navigation window' },
      S = { function() require('aerial').toggle({ direction = 'left' }) end, 'Symbols outline' },
    },
  }, { buffer = bufnr, prefix = '<leader>'})

  nmap('gd', vim.lsp.buf.definition, 'Goto Definition')
  nmap('gD', vim.lsp.buf.declaration, 'Goto Declaration')
  nmap('gr', vim.lsp.buf.references, 'Goto References')
  nmap('gI', vim.lsp.buf.implementation, 'Goto Implementation')
  nmap('gt', vim.lsp.buf.type_definition, 'Type Definition')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
end

local servers = {
  cssls = {},
  html = {},
  tsserver = {},

  tailwindcss = {
    filetypes = {
      'html',
      'css',
      'javascript',
      'javascriptreact',
    },
  },

  intelephense = {
    ['intelephense.files.maxSize'] = 1000000,
    ['intelephense.maxMemory'] = 2048,
  },

  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
      root_dir = require('lspconfig.util').root_pattern('.git'),
    }
  end
}


vim.lsp.set_log_level('off');

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
