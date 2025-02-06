-- grapple.lua

return {
  'cbochs/grapple.nvim',
  cmd = "Grapple",
  dependencies = {
    'echasnovski/mini.nvim',
  },
  opts = {
    scope = 'git'
  },
  keys = {
    { '<leader>gt', mode = 'n', function () require('grapple').toggle() end, desc = 'Toggle tag' },
    { '<leader>gp', mode = 'n', function () require('grapple').toggle_tags() end, desc = 'Tags popup' },
  },
}
