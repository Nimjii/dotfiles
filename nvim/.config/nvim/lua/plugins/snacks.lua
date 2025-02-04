-- snacks.lua

return {
  'folke/snacks.nvim',
  lazy = false,
  priority = 1000,
  opts = {
    explorer = {
      replace_netrw = true,
    },
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
    picker = {
      sources = {
        explorer = {
          auto_close = true,
          exclude = {
            '.DS_Store',
          },
          git_status_open = true,
          hidden = true,
          ignored = true,
          layout = {
            preset = 'default',
            preview = true,
            layout = {
              width = 0.95,
              height = 0.9,
            },
          },
          win = {
            list = {
              keys = {
                ['<c-c>'] = { 'close', mode = { 'n', 'i' } },
              },
            },
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
    { '<leader>e', mode = 'n', function () require('snacks.picker').explorer() end, desc = 'Toggle file tree' },
    { '<leader>ho', mode = 'n', function () require('snacks.gitbrowse').open({ what = 'commit' }) end, desc = 'Open commit url' },
    { '<leader>hf', mode = 'n', function () require('snacks.gitbrowse').open() end, desc = 'Open file url' },
    { '<leader>.', mode = 'n', function () require('snacks').scratch() end, desc = 'Open scratch buffer' },
    { '<leader>n', mode = 'n', function () require('snacks.scratch').select() end, desc = 'Choose scratch buffer' },
  },
}
