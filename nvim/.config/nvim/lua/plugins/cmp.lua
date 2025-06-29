-- cmp.lua

return {
  -- Autocompletion
  'hrsh7th/nvim-cmp',
  event = 'VeryLazy',
  enabled = false,
  dependencies = {
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-cmdline',

    {
      'js-everts/cmp-tailwind-colors',
      opts = {
        enable_alpha = true,
        format = function(itemColor)
          return {
            fg = itemColor,
            bg = nil,
            text = 'Color',
          }
        end,
      },
    },

    {
      'onsails/lspkind.nvim',
      opts = {
        symbol_map = {
          Color = '󰌁',
          Copilot = '',
          String = '',
        }
      },
    },
  },
  config = function ()
    local cmp = require('cmp')
    local ls = require('luasnip')
    local lspkind = require('lspkind')

    local border_opts = {
      border = 'single',
      winhighlight = 'CursorLine:Visual,Search:None',
    }

    local confirm_mapping = cmp.mapping {
      i = function(fallback)
       if cmp.visible() and cmp.get_active_entry() then
         cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
       else
         fallback()
       end
      end,
      s = cmp.mapping.confirm({ select = false }),
      c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
    }

    require('luasnip.loaders.from_vscode').lazy_load()
    require('luasnip.loaders.from_lua').lazy_load({paths = '~/.config/nvim/lua/snippets'})
    require('luasnip.loaders.from_snipmate').load({paths = '~/.config/nvim/snippets'})

    ls.config.setup {}

    cmp.setup({
      enabled = function ()
        local buf = vim.api.nvim_get_current_buf()
        local buf_filetype = vim.api.nvim_get_option_value('filetype', { buf = buf })
        local filetype_denylist = { 'snacks_picker_input', 'snacks_picker_list' }

        if vim.tbl_contains(filetype_denylist, buf_filetype) then
          return false
        end

        return not vim.g.cmp_disable
      end,
      window = {
        completion = cmp.config.window.bordered(border_opts),
        documentation = cmp.config.window.bordered(border_opts),
      },
      formatting = {
        fields = { 'kind', 'abbr', 'menu' },
        format = lspkind.cmp_format({
          before = function (entry, item)
            if item.kind == 'Color' then
              return require('cmp-tailwind-colors').format(entry, item)
            end
            return item
          end
        }),
      },
      snippet = {
        expand = function(args)
          ls.lsp_expand(args.body)
        end,
      },
      preselect = cmp.PreselectMode.None,
      confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      },
      mapping = cmp.mapping.preset.insert {
        ['<C-c>'] = function()
          cmp.abort()
          vim.g.cmp_disable = true
        end,
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete {},
        ['<CR>'] = confirm_mapping,
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif ls.expand_or_locally_jumpable() then
            ls.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif ls.locally_jumpable(-1) then
            ls.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      },
      sources = cmp.config.sources {
        { name = 'nvim_lsp', priority = 1000 },
        { name = 'luasnip', priority = 900 },
        { name = 'nvim_lsp_signature_help', priority = 800 },
        { name = 'buffer', priority = 700 },
        {
          name = 'path',
          priority = 600,
          option = {
            trailing_slash = true,
          },
        },
      },
    })

    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline {
        ['<CR>'] = confirm_mapping,
      },
      sources = {
        { name = 'buffer'},
      },
    })

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline {
        ['<CR>'] = confirm_mapping,
      },
      sources = cmp.config.sources(
        {
          { name = 'path' },
        },
        {
          { name = 'cmdline' },
        }
      )
    })

    cmp.event:on('menu_opened', function ()
      vim.b.copilot_suggestion_hidden = true
    end)

    cmp.event:on('menu_closed', function ()
      vim.b.copilot_suggestion_hidden = false
    end)
  end,
  keys = {
    { '<Tab>', mode = { 'n' }, function () require('luasnip').jump(1) end, silent = true, },
    { '<S-Tab>', mode = { 'n' }, function () require('luasnip').jump(-1) end, silent = true, },
  },
}
