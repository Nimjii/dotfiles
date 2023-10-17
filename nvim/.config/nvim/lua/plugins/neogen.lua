-- neogen.lua

return {
  'danymat/neogen',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },
  opts = {
    enabled = true,
    input_after_comment = true,
    snippet_engine = 'luasnip',
  },
  keys = {
    { '<leader>af', mode = 'n', function() require("neogen").generate({ type = 'func' }) end, desc = 'Function annotation' },
    { '<leader>ac', mode = 'n', function() require("neogen").generate({ type = 'class' }) end, desc = 'Class annotation' },
    { '<leader>at', mode = 'n', function() require("neogen").generate({ type = 'type' }) end, desc = 'Type annotation' },
  },
}

