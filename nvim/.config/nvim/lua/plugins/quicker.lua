-- quicker.lua

return {
  'stevearc/quicker.nvim',
  event = 'Filetype qf',
  opts = {
    opts = {
      number = true,
    },
    keys = {
      { '>', function () require('quicker').expand({ before = 2, after = 2, add_to_existing = true }) end, desc = 'Expand quickfix content' },
      { '<', function () require('quicker').collapse() end, desc = 'Collapse quickfix content' },
    },
  },
}

