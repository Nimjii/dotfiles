-- dap.lua

return {
  'mfussenegger/nvim-dap',
  dependencies = {
    {
      'rcarriga/nvim-dap-ui',
      dependencies = {
        'nvim-neotest/nvim-nio',
      },
      opts = {
        floating = {
          border = 'rounded',
        },
      },
    },

    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',
  },
  config = function()
    local dap = require('dap')
    local defaults = {
      type = "php",
      request = "launch",
      port = 9003,
    }

    require('mason-nvim-dap').setup {
      automatic_setup = true,
      automatic_installation = true,
      ensure_installed = {
        'php',
      },
      handlers = {
        function (config)
          require('mason-nvim-dap').default_setup(config)
        end,
        php = function (config)
          config.adapters = {
            type = "executable",
            command = "node",
            args = { "/Users/l.spreitzer/.local/share/nvim/mason/packages/php-debug-adapter/extension/out/phpDebug.js" },
          }

          config.configurations = {
            vim.tbl_deep_extend('force', defaults, {
              name = "NXT",
              hostname = "www-nxtcontrol-com.ddev.site",
              pathMappings = {
                ["/var/www/html"] = "/Users/l.spreitzer/projects/work/www-nxtcontrol-com",
              },
            }),
            vim.tbl_deep_extend('force', defaults, {
              name = "OeSV",
              hostname = "www-segelverband-at.ddev.site",
              pathMappings = {
                ["/var/www/html"] = "/Users/l.spreitzer/projects/work/segelverband-at",
              },
            }),
            vim.tbl_deep_extend('force', defaults, {
              name = "PVÖ",
              hostname = "www-pvoe-at.ddev.site",
              pathMappings = {
                ["/var/www/html"] = "/Users/l.spreitzer/projects/work/www-pvoe-at/src",
              },
            }),
            vim.tbl_deep_extend('force', defaults, {
              name = "VCC",
              hostname = "www-viennacitycard-at.ddev.site",
              pathMappings = {
                ["/var/www/html"] = "/Users/l.spreitzer/projects/work/www-viennacitycard-at",
              },
            }),
            vim.tbl_deep_extend('force', defaults, {
              name = "VPG",
              hostname = "www-viennapass-de.ddev.site",
              pathMappings = {
                ["/var/www/html"] = "/Users/l.spreitzer/projects/work/www-viennapass-de/src",
              },
            }),
          }

          require('mason-nvim-dap').default_setup(config)
        end,
      },
    }

    dap.listeners.after.event_initialized['dapui_config'] = function () require('dapui').open() end
    dap.listeners.before.event_terminated['dapui_config'] = function () require('dapui').close() end
    dap.listeners.before.event_exited['dapui_config'] = function () require('dapui').close() end
  end,
  keys = {
    { '<leader>db', mode = 'n', function () require('dap').toggle_breakpoint() end, desc = 'Toggle breakpoint' },
    { '<leader>dB', mode = 'n', function () require('dap').set_breakpoint(vim.fn.input 'Condition: ') end, desc = 'Set conditional breakpoint' },
    { '<leader>dc', mode = 'n', function () require('dap').continue() end, desc = 'Start/Continue' },
    { '<leader>dC', mode = 'n', function () require('dap').clear_breakpoints() end, desc = 'Clear all breakpoints' },
    {
      '<leader>de',
      mode = 'n',
      function()
        vim.ui.input({ prompt = "Expression: " }, function(expr)
          if expr then require("dapui").eval(expr, { enter = true }) end
        end)
      end,
      desc = 'Evaluate expression',
    },
    { '<leader>di', mode = 'n', function () require('dap').step_into() end, desc = 'Step into' },
    { '<leader>ds', mode = 'n', function () require('dap').run_to_cursor() end, desc = 'Run to cursor' },
    { '<leader>do', mode = 'n', function () require('dap').step_over() end, desc = 'Step over' },
    { '<leader>du', mode = 'n', function () require('dapui').toggle() end, desc = 'Toggle debugger' },
    { '<leader>de', mode = 'v', function () require('dapui').eval() end, desc = 'Evaluate expression' },
  },
}

