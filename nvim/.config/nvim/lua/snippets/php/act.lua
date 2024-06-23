-- act.lua

local ls = require('luasnip')

return {
  ls.snippet('act', {
    ls.text_node('public function '),
    ls.insert_node(1, 'show'),
    ls.text_node('Action('),
    ls.insert_node(2, ''),
    ls.text_node({'): ResponseInterface', '{', '\t'}),
    ls.insert_node(3, ''),
    ls.text_node({'', '}'}),
    ls.insert_node(0),
  })
}

