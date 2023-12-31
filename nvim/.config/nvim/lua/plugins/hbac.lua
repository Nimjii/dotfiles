-- hbac.lua

return {
  'axkirillov/hbac.nvim',
  event = 'VeryLazy',
  enabled = false,
  opts = {
    close_command = function(bufnr)
      pcall(vim.api.nvim_buf_delete, bufnr, {})
    end,
    telescope = {
      ignore_current_buffer = true,
    },
  },
  keys = {
    { '<leader>HC', mode = 'n', function () require('hbac').close_unpinned() end, desc = 'Close all unpinned buffers' },
    { '<leader>HP', mode = 'n', function () require('hbac').pin_all() end, desc = 'Pin all buffers' },
    { '<leader>Ht', mode = 'n', function () require('hbac').toggle_pin() end, desc = 'Toggle pin' },
    { '<leader>HU', mode = 'n', function () require('hbac').unpin_all() end, desc = 'Unpin all buffers' },
  },
}

