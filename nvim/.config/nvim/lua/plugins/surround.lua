-- surround.lua

return {
  'kylechui/nvim-surround',
  version = '*',
  event = "VeryLazy",
  opts = {
    keymaps = {
      insert = false,
      insert_line = false,
      normal = 'ss',
      normal_cur = 'sS',
      normal_line = 'sl',
      normal_cur_line = 'sL',
      visual = 's',
      visual_line = 'S',
      delete = 'sd',
      change = 'sc',
      change_line = 'sC',
    },
  },
}
