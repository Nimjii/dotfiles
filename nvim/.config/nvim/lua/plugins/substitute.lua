-- substitute.lua

return {
  'gbprod/substitute.nvim',
  dependencies = {
    'gbprod/yanky.nvim',
  },
  config = function ()
    require('substitute').setup({
      exchange = {
        preserve_cursor_position = true,
      },
      highlight_substituted_text = {
        enabled = false,
      },
      on_substitute = require('yanky.integration').substitute(),
      preserve_cursor_position = true,
      yank_substituted_text = false,
    })
  end,
  keys = {
    { 'm', mode = { 'n' }, function () require('substitute').operator() end, desc = 'Substitute', noremap = true },
    { 'mm', mode = { 'n' }, function () require('substitute').line() end, desc = 'Substitute line', noremap = true },
    { 'm', mode = { 'x' }, function () require('substitute').visual() end, desc = 'Substitute', noremap = true },
    { 'mx', mode = { 'n' }, function () require('substitute.exchange').operator() end, desc = 'Exchange', noremap = true },
    { 'mxx', mode = { 'n' }, function () require('substitute.exchange').line() end, desc = 'Exchange line', noremap = true },
    { 'mx', mode = { 'x' }, function () require('substitute.exchange').visual() end, desc = 'Exchange', noremap = true },
  },
}
