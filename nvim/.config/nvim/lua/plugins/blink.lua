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
      config = function (_, opts)
        require('luasnip.loaders.from_vscode').lazy_load()
        require('luasnip.loaders.from_lua').lazy_load({paths = '~/.config/nvim/lua/snippets'})
        require('luasnip.loaders.from_snipmate').load({paths = '~/.config/nvim/snippets'})

        require('luasnip').setup(opts)
      end
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
      menu = { border = 'rounded' },
      documentation = {
        auto_show = false,
        auto_show_delay_ms = 500,
        window = { border = 'rounded' },
      },
    },
    fuzzy = { implementation = 'lua' },
    keymap = {
      preset = 'default',
    },
    signature = {
      enabled = true,
      window = { border = 'rounded' },
    },
    snippets = { preset = 'luasnip' },
    sources = {
      default = { 'snippets', 'lsp', 'lazydev', 'path', 'buffer' },
      providers = {
        lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
      },
    },
  },
}
