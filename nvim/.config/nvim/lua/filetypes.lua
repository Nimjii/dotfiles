-- @module filetypes

local function typoscript_callback()
  vim.bo.commentstring = '#%s'
  vim.bo.syntax = 'typoscript'
  vim.o.foldmethod = 'syntax'
  return 'typoscript'
end

vim.filetype.add({
  extension = {
    tsconfig = 'tsconfig',
    typoscript = typoscript_callback,
  },
  pattern = {
    ['.*/TypoScript/.*%.ts'] = {
      priority = math.huge,
      typoscript_callback,
    },
    ['.*/TypoScript/.*%.txt'] = {
      priority = math.huge,
      typoscript_callback,
    },
  },
})

