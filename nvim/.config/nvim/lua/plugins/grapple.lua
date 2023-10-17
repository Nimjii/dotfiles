-- grapple.lua

return {
  'cbochs/grapple.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    scope = 'directory'
  },
  keys = {
    { '<leader>gt', mode = 'n', function () require('grapple').toggle() end, desc = 'Toggle tag' },
    { '<leader>gp', mode = 'n', function () require('grapple').popup_tags() end, desc = 'Tags popup' },
  },
}
