-- treesitter.lua

return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',

    {
      'windwp/nvim-ts-autotag',
      opts = {
        enable_close = true,
        enable_rename = true,
        enable_close_on_slash = true,
      },
    },

    {
      'nvim-treesitter/nvim-treesitter-context',
      opts = {
        enable = true,
        max_lines = 6,
        min_window_height = 0,
        line_numbers = true,
        multiline_threshold = 20,
        trim_scope = 'outer',
        mode = 'cursor',
        separator = nil,
        zindex = 20,
      },
    }
  },
  build = ':TSUpdate',
  config = function ()
    local configs = require('nvim-treesitter.configs')

    configs.setup({
      auto_install = false,
      sync_install = true,
      ignore_install = {},
      modules = {},
      highlight = {
        enable = true,
        disable = function (_, buf)
          if require('utils').is_large_file(buf) then
            return true
          end
        end,
        additional_vim_regex_highlighting = { 'html' },
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<C-G>',
          node_incremental = '<C-G>',
          node_decremental = '<C-Q>',
        },
      },
      indent = {
        enable = true,
        disable = { 'html' },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['aa'] = '@parameter.outer',
            ['ia'] = '@parameter.inner',
            ['aF'] = '@function.outer',
            ['iF'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
            ["ar"] = '@loop.outer',
            ["ir"] = '@loop.inner',
            ["ae"] = '@conditional.outer',
            ["ie"] = '@conditional.inner',
          },
          selection_modes = {
            ["@function.outer"] = "V",
            ["@function.inner"] = "V",
            ["@class.outer"] = "V",
            ["@class.inner"] = "V",
            ["@parameter.outer"] = "v",
            ["@parameter.inner"] = "v",
            ["@loop.outer"] = "V",
            ["@loop.inner"] = "V",
            ["@conditional.outer"] = "V",
            ["@conditional.inner"] = "V",
          },
          include_surrounding_whitespace = function(opts)
            return opts["query_string"] == "@parameter.outer"
          end,
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            [']m'] = '@function.outer',
            [']]'] = '@class.outer',
          },
          goto_next_end = {
            [']M'] = '@function.outer',
            [']['] = '@class.outer',
          },
          goto_previous_start = {
            ['[m'] = '@function.outer',
            ['[['] = '@class.outer',
          },
          goto_previous_end = {
            ['[M'] = '@function.outer',
            ['[]'] = '@class.outer',
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ['<leader>s'] = '@parameter.inner',
          },
          swap_previous = {
            ['<leader>S'] = '@parameter.inner',
          },
        },
      },
      ensure_installed = {
        'bash',
        'css',
        'csv',
        'diff',
        'dockerfile',
        'editorconfig',
        'fish',
        'git_config',
        'git_rebase',
        'gitattributes',
        'gitcommit',
        'gitignore',
        'go',
        'html',
        'ini',
        'javascript',
        'json',
        'lua',
        'make',
        'markdown',
        'markdown_inline',
        'passwd',
        'php',
        'phpdoc',
        'python',
        'regex',
        'rust',
        'scss',
        'sql',
        'swift',
        'toml',
        'tsx',
        'vim',
        'vimdoc',
        'vue',
        'xml',
        'yaml',
      },
    })
  end,
}
