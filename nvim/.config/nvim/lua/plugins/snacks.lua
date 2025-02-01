-- snacks.lua

return {
  'folke/snacks.nvim',
  lazy = false,
  opts = {
    indent = {
      indent = {
        enabled = true,
        char = '┊',
        hl = {
          'SnacksIndent1',
          'SnacksIndent2',
          'SnacksIndent3',
          'SnacksIndent4',
          'SnacksIndent5',
          'SnacksIndent6',
          'SnacksIndent7',
        },
      },
    },
    scratch = {
      ft = function ()
        return 'markdown'
      end,
    },
    statuscolumn = {
      enabled = true,
    },
  },
  keys = {
    { '<leader>ho', mode = 'n', function () require('snacks.gitbrowse').open({ what = 'commit' }) end, desc = 'Open commit url' },
    { '<leader>hf', mode = 'n', function () require('snacks.gitbrowse').open() end, desc = 'Open file url' },
    { '<leader>.', mode = 'n', function () require('snacks').scratch() end, desc = 'Open scratch buffer' },
    { '<leader>n', mode = 'n', function () require('snacks.scratch').select() end, desc = 'Choose scratch buffer' },
  },
}
