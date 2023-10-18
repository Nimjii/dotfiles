-- indent_blankline.lua

return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  config = function ()
    local hooks = require('ibl.hooks')
    local highlight = {
      'RainbowRed',
      'RainbowYellow',
      'RainbowBlue',
      'RainbowOrange',
      'RainbowGreen',
      'RainbowViolet',
      'RainbowCyan',
    }

    hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
    hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_tab_indent_level)

    require('ibl').setup({
      indent = {
        char = '┊',
        highlight = highlight,
      },
      scope = {
        enabled = false,
      },
    })
  end,
}
