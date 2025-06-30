-- @module autocmds.lua

-- [[ Enable copilot suggestions when exiting insert mode ]]
vim.api.nvim_create_autocmd('InsertLeave', {
  pattern = '*',
  callback = function ()
    vim.b.copilot_suggestion_hidden = false
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
