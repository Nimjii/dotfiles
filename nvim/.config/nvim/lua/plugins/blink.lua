-- blink.lua

return {
  'saghen/blink.cmp',
  event = 'VimEnter',
  version = '1.*',
  dependencies = {
    {
      'L3MON4D3/LuaSnip',
      version = '2.*',
      build = (function()
        if vim.fn.executable 'make' == 0 then
          return
        end
        return 'make install_jsregexp'
      end)(),
    },

    {
      'onsails/lspkind.nvim',
      opts = {
        symbol_map = {
          Color = '󰌁',
          Copilot = '',
          String = '',
        },
      },
    },

    'folke/lazydev.nvim',
  },
  opts = {
    appearance = {
      nerd_font_variant = 'mono',
    },
    completion = {
      documentation = {
        auto_show = false,
        auto_show_delay_ms = 500,
      },
    },
    fuzzy = { implementation = 'lua' },
    keymap = {
      preset = 'default',
    },
    signature = { enabled = true },
    snippets = { preset = 'luasnip' },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'lazydev' },
      providers = {
        lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
      },
    },
  },
}
