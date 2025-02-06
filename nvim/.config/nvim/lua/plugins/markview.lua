-- markdown_preview.lua

return {
  {
    'OXY2DEV/markview.nvim',
    lazy = false,
    opts = {
      preview = {
        filetypes = { 'markdown', 'yaml' },
        icon_provider = 'mini',
      },
      html = {
        enable = false,
      },
      latex = {
        enable = false,
      },
      typst = {
        enable = false,
      },
    },
  },
  {
    'OXY2DEV/helpview.nvim',
    lazy = false,
    opts = {
      preview = {
        icon_provider = 'mini',
      },
    },
  },
}
