-- copilot_chat.lua

return {
  'CopilotC-Nvim/CopilotChat.nvim',
  branch = 'main',
  dependencies = {
    'zbirenbaum/copilot.lua',
    'nvim-lua/plenary.nvim',
  },
  config = true,
  keys = {
    { '<leader>ce', mode = 'n', '<cmd>CopilotChatOpen<cr>', desc = 'Open CopilotChat in vertical split' },
    { '<leader>cf',
      mode = 'n',
      function()
        require('CopilotChat').open({
          window = {
            layout = 'float',
            title = 'CopilotChat',
            border = 'single',
            width = 160,
            height = 40,
          },
        })
      end,
      desc = 'Open CopilotChat in floating window',
    },
    { '<leader>cq', mode = 'n', '<cmd>CopilotChatClose<cr>', desc = 'Close CopilotChat' },
    { '<leader>cs', mode = 'n', '<cmd>CopilotChatStop<cr>', desc = 'Stop current CopilotChat output' },
    { '<leader>cr', mode = 'n', '<cmd>CopilotChatReset<cr>', desc = 'Reset current CopilotChat window' },
    {
      '<leader>ca',
      mode = { 'v', 'x' },
      function()
        local actions = require 'CopilotChat.actions'

        actions.pick(actions.prompt_actions({ selection = require('CopilotChat.select').visual }))
      end,
      desc = 'Pick from CopilotChat prompts',
    },
  },
}
