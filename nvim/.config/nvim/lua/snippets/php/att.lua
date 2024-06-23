-- att.lua

local ls = require('luasnip')

return {
  ls.snippet('att', {
    ls.text_node('protected '),
    ls.insert_node(2, 'string'),
    ls.text_node(' $'),
    ls.insert_node(1, 'foo'),
    ls.text_node(' = '),
    ls.insert_node(3, [['value']]),
    ls.text_node({';', ''}),
    ls.insert_node(0),
  })
}
