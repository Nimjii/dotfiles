-- copilot.lua

return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'InsertEnter',
  opts = {
    copilot_node_command = vim.fn.expand '$HOME' .. '/.local/share/nvm/v20.15.0/bin/node',
    filetypes = {
      [''] = false,
    },
    suggestion = {
      auto_trigger = true,
      hide_during_completion = false,
      trigger_on_accept = false,
      keymap = {
        accept = nil,
        next = '<C-n>',
        prev = '<C-p>',
        dismiss = nil,
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
    {
      '<Tab>',
      mode = 'i',
      function()
        if require('copilot.suggestion').is_visible() then
          require('copilot.suggestion').accept()
        else
          return '<Tab>'
        end

        return ''
      end,
      desc = 'Tab or accept copilot suggestion',
      expr = true,
    },
    {
      '<C-e>',
      mode = 'i',
      function()
        if vim.b.copilot_suggestion_hidden then
          require('copilot.suggestion').next()
        else
          require('copilot.suggestion').dismiss()
        end

        vim.b.copilot_suggestion_hidden = not vim.b.copilot_suggestion_hidden
      end,
      desc = 'Tab or accept copilot suggestion',
      expr = true,
    },
    {
      '<leader>cp',
      mode = 'n',
      function()
        require('copilot.panel').open {}
      end,
      desc = 'Show panel',
    },
    {
      '<leader>ct',
      mode = 'n',
      function()
        require('copilot.suggestion').toggle_auto_trigger()
      end,
      desc = 'Toggle auto trigger',
    },
  },
}
