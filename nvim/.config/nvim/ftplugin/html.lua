-- Automatically close self-closing tag when pressing /
vim.keymap.set('i', 'a', function()
  local node = vim.treesitter.get_node()

  if not node then
    return '/'
  end

  local first_child_node = node:child(0)

  if not first_child_node then
    return '/'
  end

  local is_tag_writing_in_progress = node:type() == 'element' and first_child_node:type() == 'start_tag'
  local start_tag_text = vim.treesitter.get_node_text(first_child_node, 0)
  local tag_is_already_terminated = string.match(start_tag_text, '>$')

  if is_tag_writing_in_progress and not tag_is_already_terminated then
    local char_at_cursor = vim.fn.strcharpart(vim.fn.strpart(vim.fn.getline '.', vim.fn.col '.' - 2), 0, 1)
    local already_have_space = char_at_cursor == ' '

    return already_have_space and '/>' or ' />'
  end

  return '/'
end, { expr = true, buffer = true })

-- Automatically add quotes for attributes
vim.keymap.set('i', '=', function()
  local cursor = vim.api.nvim_win_get_cursor(0)
  local left_of_cursor_range = { cursor[1] - 1, cursor[2] - 1 }
  local node = vim.treesitter.get_node { pos = left_of_cursor_range }
  local nodes_active_in = {
    'attribute_name',
    'directive_argument',
    'directive_name',
  }

  if not node or not vim.tbl_contains(nodes_active_in, node:type()) then
    return '='
  end

  return '=""<left>'
end, { expr = true, buffer = true })
