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
