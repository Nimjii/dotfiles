-- copilot.lua

return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'InsertEnter',
  opts = {
    copilot_node_command = vim.fn.expand('$HOME') .. '/.local/share/nvm/v20.15.0/bin/node',
    filetypes = {
      [''] = false,
    },
    suggestion = {
      auto_trigger = true,
      hide_during_completion = false,
      keymap = {
        accept = '<Tab>',
        next = '<C-n>',
        prev = '<C-p>',
        dismiss = '<C-e>',
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
