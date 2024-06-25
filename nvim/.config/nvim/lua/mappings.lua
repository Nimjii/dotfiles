-- @module mappings

-- Mapping groups
require('which-key').register({
  c = { mode = { 'n', 'v' }, name = ' Copilot' },
  d = { mode = { 'n', 'v' }, name = ' Debugger' },
  f = { name = '󰍉 Find' },
  F = { mode = { 'n', 'v' }, name = ' Files' },
  g = { name = '󰛢 Grapple' },
  G = { name = ' Git blame' },
  h = { name = ' Hunk Actions' },
  H = { name = '󰤱 Pins' },
  p = { name = ' Portal' },
  Q = { name = ' Quickfix' },
  t = { name = ' ToggleTerm' },
}, { prefix = '<leader>' })

-- Qol mappings
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set({ 'n' }, '<C-z>', '<Nop>', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'v' }, '<C-f>', '<C-f>zz', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<C-b>', '<C-b>zz', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<C-d>', '<C-d>zz', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<C-u>', '<C-u>zz', { silent = true })
vim.keymap.set({ 'n', 'v' }, '{', '{zz', { silent = true })
vim.keymap.set({ 'n', 'v' }, '}', '}zz', { silent = true })
vim.keymap.set({ 'n' }, '*', '*zzzv', { silent = true })
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
vim.keymap.set({ 'n' }, '<C-x>', '<C-w>v', { desc = 'Create vertical split' })

-- Mappings for moving lines in visual mode
vim.keymap.set('v', '<S-j>', ":m '>+1<CR>gv=gv", { desc = 'Move line downwards', silent = true })
vim.keymap.set('v', '<S-k>', ":m '<-2<CR>gv=gv", { desc = 'Move line upwards', silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Navigation mappings
vim.keymap.set('n', ']t', function () vim.cmd.tabnext() end, { desc = 'Next tab' })
vim.keymap.set('n', '[t', function () vim.cmd.tabprevious() end, { desc = 'Previous tab' })

-- Buffer mappings
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>', { desc = 'Save' })
vim.keymap.set('n', '<leader>W', '<cmd>noa w<cr>', { desc = 'Save (no autocommands)' })
vim.keymap.set('n', '<leader>q', '<cmd>confirm q<cr>', { desc = 'Quit' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>m', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })

-- Automatic indenting when entering insert mode
vim.keymap.set({ 'n' }, 'i', function ()
  if #vim.fn.getline('.') == 0 then
    return [["_cc]]
  else
    return 'i'
  end
end, { expr = true, desc = 'Enter insert mode' })

