-- @module utils.autocmds

-- [[ Enable cmp on insert ]]
vim.api.nvim_create_autocmd('InsertEnter', {
  pattern = '*',
  callback = function ()
    vim.g.cmp_disable = false
  end,
})

-- [[ Highlight on yank ]]
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function ()
    pcall(function ()
      require('illuminate').pause_buf()
      vim.wait(25)
      vim.highlight.on_yank()
      vim.wait(25)
      require('illuminate').resume_buf()
    end)
  end,
  group = highlight_group,
  pattern = '*',
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
      vim.opt_local.foldmethod = 'manual'
      vim.opt_local.swapfile = false
      vim.opt_local.undolevels = -1
      vim.opt_local.undoreload = 0

      vim.cmd('filetype off')
      vim.cmd('syntax off')
    else
      vim.cmd('filetype on')
      vim.cmd('syntax on')
    end
  end,
})

