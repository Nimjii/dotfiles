-- con.lua

local ls = require('luasnip')

return {
  ls.snippet('con', {
    ls.text_node('public function __construct('),
    ls.insert_node(1, ''),
    ls.text_node({')', '{', '\t'}),
    ls.insert_node(2, ''),
    ls.text_node({'', '}'}),
    ls.insert_node(0),
  })
}

