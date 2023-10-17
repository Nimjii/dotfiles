-- oil.lua

return {
  'stevearc/oil.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    keymaps = {
      ['<C-b>'] = 'actions.preview_scroll_up',
      ['<C-f>'] = 'actions.preview_scroll_down',
      ['<C-h>'] = false,
      ['<C-l>'] = false,
      ['<C-s>'] = 'actions.select_split',
      ['<C-v>'] = 'actions.select_vsplit',
      ['<C-o>'] = {
        callback = function ()
          local oil = require('oil')
          local name = oil.get_cursor_entry()['parsed_name']
          local path = oil.get_current_dir() .. name

          require('utils').system_open(path)
        end,
        desc = 'Open in finder',
        nowait = true,
      },
    },
    view_options = {
      show_hidden = true,
      is_always_hidden = function (name)
        return name == '.DS_Store'
      end
    },
  },
  keys = {
    { '<leader>o', mode = 'n', function () vim.cmd('Oil') end, desc = 'Open oil in current directory' },
    {
      '<leader>O',
      mode = 'n',
      function ()
        require('utils.telescope').oil_picker(
          {
            show_preview = true,
            hidden = false,
            no_ignore = false,
          }
        )
      end,
      desc = 'Open oil in current directory'
    },
  },
}

