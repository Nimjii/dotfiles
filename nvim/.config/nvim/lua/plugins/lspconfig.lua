-- lspconfig.lua

return {
  'neovim/nvim-lspconfig',
  dependencies = {
    {
      'williamboman/mason.nvim',
      config = true,
    },

    'WhoIsSethDaniel/mason-tool-installer.nvim',
    'williamboman/mason-lspconfig.nvim',
    'folke/neodev.nvim',
    'folke/which-key.nvim',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/nvim-cmp',
  },
  config = function ()
    require('neodev').setup()

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
      callback = function (event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)

        require('which-key').register({
          l = {
            name = '󰚔 LSP',
            r = { vim.lsp.buf.rename, 'Rename symbol' },
            a = { vim.lsp.buf.code_action, 'Code action' },
            f = { vim.lsp.buf.format, 'Format buffer' },
            s = { function() require('aerial').nav_toggle() end, 'Symbols navigation window' },
            S = { function() require('aerial').toggle({ direction = 'left' }) end, 'Symbols outline' },
          },
        }, { buffer = event.buf, prefix = '<leader>'})

        vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = event.buf, desc = 'LSP: Hover documentation' })

        if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        end
      end,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    local servers = {
      html = {},
      ts_ls = {},

      cssls = {
        filetypes = {
          'scss',
          'sass',
        },
      },

      tailwindcss = {
        filetypes = {
          'html',
          'css',
          'javascript',
          'javascriptreact',
        },
        tailwindCSS = {
          files = {
            exclude = {
              '**/.git/**',
              '**/node_modules/**',
              '**/.hg/**',
              '**/.svn/**',
              '**/*.scss',
            }
          },
        },
      },

      intelephense = {
        intelephense = {
          completion = {
            suggestObjectOperatorStaticMethods = false,
          },
          files = {
            maxSize = 5000000,
          },
          maxMemory = 4096,
          phpdoc = {
            returnVoid = false,
          },
          references = {
            exclude = {},
          },
          runtime = '/usr/local/bin/node',
        },
      },

      lua_ls = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
    }

    require('mason').setup()

    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, { 'stylua' })

    require('mason-tool-installer').setup({ ensure_installed = ensure_installed })

    require('mason-lspconfig').setup({
      handlers = {
        function (server_name)
          require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            settings = servers[server_name],
            filetypes = (servers[server_name] or {}).filetypes,
            root_dir = require('lspconfig.util').root_pattern('.git'),
          }
        end,
      },
    })

    vim.lsp.set_log_level('off');
  end,
}
