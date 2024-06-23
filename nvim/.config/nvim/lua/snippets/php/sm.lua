-- sm.lua

local ls = require('luasnip')
local utils = require('utils.snippets')

return {
  ls.snippet('sm', {
    ls.text_node('public function set'),
    ls.function_node(utils.copyUpper, 1),
    ls.text_node('('),
    ls.insert_node(2, 'string'),
    ls.text_node(' $'),
    ls.insert_node(1, 'foo'),
    ls.text_node({'): static', '{', '\t$this->'}),
    ls.function_node(utils.copy, 1),
    ls.text_node(' = $'),
    ls.function_node(utils.copy, 1),
    ls.text_node({';', '\treturn $this;', '}'}),
    ls.insert_node(0),
  })
}

