-- undotree.lua

return {
  'mbbill/undotree',
  config = function ()
    vim.g.undotree_WindowLayout = 2
    vim.g.undotree_SplitWidth = 36
    vim.g.undotree_SetFocusWhenToggle = 1
  end,
  keys = {
    { '<F5>', mode = { 'n' }, '<cmd>UndotreeToggle<cr>', desc = 'Open undo tree' },
  },
}
