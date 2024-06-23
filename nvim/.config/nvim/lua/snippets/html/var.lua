-- var.lua

local ls = require('luasnip')

return {
  ls.snippet('var', {
    ls.text_node('<f:variable name="'),
    ls.insert_node(1, 'xData'),
    ls.text_node('" value="'),
    ls.insert_node(2, '{}'),
    ls.text_node('" />'),
    ls.insert_node(0),
  })
}

