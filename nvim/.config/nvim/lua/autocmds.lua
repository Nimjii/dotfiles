-- @module autocmds.lua

-- [[ Enable cmp on insert ]]
vim.api.nvim_create_autocmd('InsertEnter', {
  pattern = '*',
  callback = function ()
    vim.g.cmp_disable = false
  end,
})

-- [[ Handle trailing whitespaces and empty lines ]]
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = { '*' },
  callback = function ()
    require('utils').trim_whitespaces()
    require('utils').trim_empty_lines()
  end,
})

-- [[ Handle large files ]]
vim.api.nvim_create_autocmd('BufReadPre', {
  pattern = { '*' },
  group = vim.api.nvim_create_augroup('bigfile', {}),
  callback = function (args)
    local match = require('utils').is_large_file(args.buf)

    if match then
      vim.cmd('syntax clear')

      vim.opt_local.filetype = ''
      vim.opt_local.foldmethod = 'manual'
      vim.opt_local.list = false
      vim.opt_local.swapfile = false
      vim.opt_local.syntax = 'off'
      vim.opt_local.undolevels = -1
      vim.opt_local.undoreload = 0
    end
  end,
})

