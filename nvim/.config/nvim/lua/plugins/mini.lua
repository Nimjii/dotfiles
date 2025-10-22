-- mini.lua

return {
  'nvim-mini/mini.nvim',
  version = false,
  config = function ()
    require('mini.pairs').setup()
    require('mini.git').setup()

    require('mini.ai').setup({
      custom_textobjects = {
        a = false,
        t = false,
      },
    })

    require('mini.comment').setup({
      options = {
        ignore_blank_line = true,
      },
    })

    require('mini.diff').setup({
      view = {
        signs = {
          add = '+',
          change = '~',
          delete = '-'
        },
      },
      mappings = {
        apply = '<leader>hs',
        reset = '<leader>hr',
        textobject = 'ih',
      },
    })

    require('mini.icons').setup({
      filetype = {
        tsconfig = {
          glyph = '',
          hl = 'TSconfig',
        },
        typoscript = {
          glyph = '',
          hl = 'TypoScript',
        },
      },
    })

    require('mini.move').setup({
      mappings = {
        left = 'H',
        right = 'L',
        down = 'J',
        up = 'K',
      },
    })

    MiniIcons.mock_nvim_web_devicons()
  end,
  keys = {
    { '<leader>hd', mode = 'n', function () require('mini.diff').toggle_overlay() end, desc = 'Show diff overlay' },
    { '<leader>hs', mode = 'n', function () require('mini.git').show_at_cursor() end, desc = 'Show at cursor' },
    { '<leader>hr', mode = 'x', function () require('mini.git').show_range_history() end, desc = 'Show range history' },
  },
}
