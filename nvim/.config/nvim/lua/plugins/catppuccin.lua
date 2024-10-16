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
          enabled = false,
          colored_indent_levels = true,
        },
        mini = {
          enabled = false,
        },
        neogit = false,
        neotree = true,
        noice = true,
        nvimtree = false,
        rainbow_delimiters = false,
        treesitter_context = true,
      },
      styles = {
        conditionals = {},
      },
    })

    vim.cmd.colorscheme 'catppuccin'
  end,
}
