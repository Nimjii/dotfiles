-- copilot.lua

return {
  'jellydn/CopilotChat.nvim',
  branch = 'canary',
  dependencies = {
    'zbirenbaum/copilot.lua',
  },
  event = 'VeryLazy',
  build = function ()
    vim.defer_fn(function ()
      vim.cmd('UpdateRemotePlugins');
      vim.notify('CopilotChat - Update remote plugins. Please restart Neovim.');
    end, 3000)
  end,
  opts = {
    mode = 'split',
    debug = false,
    prompts = {
      Explain = 'Explain how it works.',
      Review = 'Review the following code and provide concise suggestions.',
      Tests = 'Briefly explain how the selected code works, then generate unit tests.',
      Refactor = 'Refactor the code to improve clarity and readability.',
      Summarize = 'Please summarize the following text.',
    },
  },
  keys = {
    { '<leader>cc', mode = 'n', '<cmd>CopilotChatInPlace<cr>', desc = 'Open chat window' },
    { '<leader>cc', mode = 'x', ':CopilotChatInPlace', desc = 'Open chat window' },
    { '<leader>ce', mode = 'n', '<cmd>CopilotChatExplain<cr>', desc = 'Explain code' },
    { '<leader>cg', mode = 'n', '<cmd>CopilotChatTests<cr>', desc = 'Generate tests' },
    { '<leader>cr', mode = 'n', '<cmd>CopilotChatReview<cr>', desc = 'Review code' },
    { '<leader>cR', mode = 'n', '<cmd>CopilotChatRefactor<cr>', desc = 'Refactor code' },
    { '<leader>cs', mode = 'n', '<cmd>CopilotChatSummarize<cr>', desc = 'Summarize text' },
  },
}

