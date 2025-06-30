-- @module autocmds.lua

-- [[ Handle trailing whitespaces and empty lines ]]
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = { '*' },
  callback = function ()
    require('utils').trim_whitespaces()
    require('utils').trim_empty_lines()
  end,
})
