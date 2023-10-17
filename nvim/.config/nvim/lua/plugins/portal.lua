-- portal.lua

return {
  'cbochs/portal.nvim',
  dependencies = {
    'cbochs/grapple.nvim',
  },
  opts = {
    labels = { 'j', 'k', 'h', 'l', 'a', 's', 'd', 'f' },
  },
  keys = {
    { '<leader>pc', mode = 'n', function () require('portal.builtin').changelist.tunnel_backward() end, desc = 'Changelist backwards' },
    { '<leader>pC', mode = 'n', function () require('portal.builtin').changelist.tunnel_forward() end, desc = 'Changelist forwards' },
    { '<leader>pg', mode = 'n', function () require('portal.builtin').grapple.tunnel_backward() end, desc = 'Grapple backwors' },
    { '<leader>pG', mode = 'n', function () require('portal.builtin').grapple.tunnel_forward() end, desc = 'Grapple forwards' },
    {
      '<leader>pj',
      mode = 'n',
      function ()
        require('portal.builtin').jumplist.tunnel_backward({
          filter = function (v)
            return v.buffer ~= vim.fn.bufnr() and string.find(vim.fn.bufname(v.buffer), 'neo-tree', nil, true) == nil
          end
        })
      end,
      desc = 'Jumplist backwards',
    },
    {
      '<leader>pJ',
      mode = 'n',
      function ()
        require('portal.builtin').jumplist.tunnel_forward({
          filter = function (v)
            return v.buffer ~= vim.fn.bufnr() and string.find(vim.fn.bufname(v.buffer), 'neo-tree', nil, true) == nil
          end
        })
      end,
      desc = 'Jumplist forwards',
    },
  },
}
