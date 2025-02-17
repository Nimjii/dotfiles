-- maximize.lua

return {
  'declancm/maximize.nvim',
  opts = {
    plugins = {
      aerial = { enable = true },
      dapui = { enable = true },
    },
  },
  keys = {
    { '<leader>x', mode = 'n', function () require('maximize').toggle() end, desc = 'Toggle split maximization' },
  },
}
