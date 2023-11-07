-- copilot.lua

return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'InsertEnter',
  opts = {
    copilot_node_command = vim.fn.expand('$HOME') .. '/.local/share/nvm/v20.6.0/bin/node',
    filetypes = {
      [''] = false,
    },
    suggestion = {
      keymap = {
        accept = '<C-k>',
        next = '<C-h>',
        prev = '<C-l>',
        dismiss = '<C-c>',
      },
    },
    server_opts_overrides = {
      settings = {
        advanced = {
          listCount = 5,
        },
      },
    },
  },
  keys = {
    { '<leader>cp', mode = 'n', function () require('copilot.panel').open({}) end, desc = 'Show panel' },
    { '<leader>ct', mode = 'n', function () require('copilot.suggestion').toggle_auto_trigger() end, desc = 'Toggle auto trigger' },
  },
}

