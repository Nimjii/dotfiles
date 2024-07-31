-- markdown_preview.lua

return {
  'MeanderingProgrammer/markdown.nvim',
  main = 'render-markdown',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'nvim-treesitter/nvim-treesitter',
  },
  opts = {
    code = {
      left_pad = 2,
      right_pad = 2,
    },
  },
}

