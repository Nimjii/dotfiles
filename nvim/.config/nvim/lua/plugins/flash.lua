-- flash.lua

return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  opts = {
    jump = {
      autojump = true,
    },
    label = {
      rainbow = {
        enabled = true,
      },
    },
    modes = {
      char = {
        autohide = false,
        jump_labels = false,
        multi_line = true,
        keys = { 't', 'T', ';', ',' },
      },
    },
    search = {
      multi_window = false,
    },
  },
  keys = {
    { 'f', mode = { 'n', 'o', 'x' }, function () require('flash').jump() end, desc = 'Flash' },
    { 'F', mode = { 'n', 'o', 'x' }, function () require('flash').treesitter() end, desc = 'Flash Treesitter' },
    { 'r', mode = { 'o', 'x' }, function () require('flash').treesitter_search() end, desc = 'Treesitter search' },
  },
}
