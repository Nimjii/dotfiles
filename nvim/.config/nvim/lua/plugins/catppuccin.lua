-- catppuccin.lua

return {
  'catppuccin/nvim',
  name = 'catppuccin',
  lazy = false,
  priority = 1000,
  config = function ()
    require('catppuccin').setup({
      flavour = 'macchiato',
      dim_inactive = {
        enabled = true,
      },
      integrations = {
        aerial = true,
        alpha = false,
        dashboard = false,
        indent_blankline = {
          enabled = true,
          colored_indent_levels = true,
        },
        neogit = false,
        neotree = true,
        noice = true,
        nvimtree = false,
        rainbow_delimiters = false,
        treesitter_context = false,
      },
    })

    vim.cmd.colorscheme 'catppuccin'
  end,
}
