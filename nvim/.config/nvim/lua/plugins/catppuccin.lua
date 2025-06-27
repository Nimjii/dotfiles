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
        blink_cmp = true,
        dashboard = false,
        fzf = false,
        illuminate = false,
        indent_blankline = {
          enabled = false,
          colored_indent_levels = true,
        },
        neogit = false,
        neotree = false,
        noice = true,
        nvim_surround = true,
        nvimtree = false,
        semantic_tokens = false,
        snacks = true,
        rainbow_delimiters = false,
        telescope = false,
        treesitter_context = false,
        ufo = false,
        which_key = true,
      },
      styles = {
        conditionals = {},
      },
    })

    vim.cmd.colorscheme 'catppuccin'
  end,
}
