-- aerial.lua

return {
  'stevearc/aerial.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    char = "▏",
    context_char = "▏",
    layout = {
      default_direction = 'prefer_left',
      placement = 'edge',
      min_width = 40,
    },
    open_automatic = true,
    show_current_context = true,
    show_trailing_blankline_indent = false,
    use_treesitter = true,
  },
}
