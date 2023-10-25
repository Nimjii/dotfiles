-- bqf.lua

return {
  'kevinhwang91/nvim-bqf',
  event = 'VimEnter',
  dependencies = {
    {
      'junegunn/fzf',
      build = function ()
        vim.fn['fzf#install']()
      end
    },
    'nvim-treesitter/nvim-treesitter',
  },
  keys = {
    { '<leader>b', mode = 'n', '<cmd>copen<cr>', desc = 'Open quickfix' },
    { '<leader>B', mode = 'n', '<cmd>cclose<cr>', desc = 'Close quickfix' },
    { '<leader>Qn', mode = 'n', '<cmd>cnext<cr>', desc = 'Next quickfix entry' },
    { '<leader>Qp', mode = 'n', '<cmd>cprevious<cr>', desc = 'Previous quickfix entry' },
    { '<leader>QN', mode = 'n', '<cmd>cnfile<cr>', desc = 'Next file in quickfix list' },
    { '<leader>QP', mode = 'n', '<cmd>cnprevious<cr>', desc = 'Previous file in quickfix list' },
  },
}

