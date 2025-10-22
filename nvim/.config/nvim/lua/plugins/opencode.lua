-- opencode.lua

return {
  "NickvanDyke/opencode.nvim",
  dependencies = {
    "folke/snacks.nvim",
  },
  config = function()
    -- Required for `vim.g.opencode_opts.auto_reload`.
    vim.o.autoread = true
  end,
  keys = {
    { '<leader>oa', mode = { 'n', 'x' }, function() require("opencode").ask("@this: ", { submit = true }) end, desc = 'Ask about this' },
    { '<leader>os', mode = { 'n', 'x' }, function() require("opencode").select() end, desc = 'Select prompt' },
    { '<leader>oA', mode = { 'n', 'x' }, function() require("opencode").prompt('@this') end, desc = 'Add this' },
    { '<leader>ot', mode = 'n', function() require("opencode").toggle() end, desc = 'Toggle embedded' },
    { '<leader>oc', mode = 'n', function() require("opencode").command() end, desc = 'Select command' },
    { '<leader>on', mode = 'n', function() require("opencode").command('session_new') end, desc = 'New session' },
    { '<leader>oi', mode = 'n', function() require("opencode").command('session_interrupt') end, desc = 'Interrupt session' },
    { '<leader>oC', mode = 'n', function() require("opencode").command('agent_cycle') end, desc = 'Cycle selected agent' },
    { '<S-C-u>', mode = 'n', function() require("opencode").command('messages_half_page_up') end, desc = 'Messages half page up' },
    { '<S-C-d>', mode = 'n', function() require("opencode").command('messages_half_page_down') end, desc = 'Messages half page down' },
  },
}
