-- init.lua

local ls = require('luasnip')

return {
  ls.snippet('init', {
    ls.text_node('public function initialize'),
    ls.insert_node(1, 'Show'),
    ls.text_node({'Action(): void', '{', '\t'}),
    ls.insert_node(2, ''),
    ls.text_node({'', '}'}),
    ls.insert_node(0),
  })
}


