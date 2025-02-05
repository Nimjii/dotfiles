-- snacks.lua

return {
  'folke/snacks.nvim',
  lazy = false,
  priority = 1000,
  opts = {
    explorer = {
      replace_netrw = true,
    },
    indent = {
      indent = {
        enabled = true,
        char = '┊',
        hl = {
          'SnacksIndent1',
          'SnacksIndent2',
          'SnacksIndent3',
          'SnacksIndent4',
          'SnacksIndent5',
          'SnacksIndent6',
          'SnacksIndent7',
        },
      },
    },
    input = {
      enabled = true,
    },
    picker = {
      sources = {
        explorer = {
          auto_close = true,
          exclude = {
            '.DS_Store',
          },
          git_status_open = true,
          hidden = true,
          ignored = true,
          layout = {
            preset = 'default',
            preview = true,
            layout = {
              width = 0.95,
              height = 0.9,
            },
          },
          win = {
            list = {
              keys = {
                ['<c-c>'] = { 'close', mode = { 'n', 'i' } },
              },
            },
          },
        },
      },
      win = {
        input = {
          keys = {
            ['<c-c>'] = { 'close', mode = { 'n', 'i' } },
          },
        },
        list = {
          keys = {
            ['<c-c>'] = { 'close', mode = { 'n', 'i' } },
          },
        },
      },
    },
    scratch = {
      ft = function ()
        return 'markdown'
      end,
    },
    statuscolumn = {
      enabled = true,
    },
    styles = {
      input = {
        relative = 'cursor',
        row = -3,
        col = 0,
      },
      terminal = {
        border = 'rounded',
        position = 'float',
        wo = {
          winhighlight = 'FloatBorder:Normal',
        },
        keys = {
          term_hide = { '<F7>', 'hide', mode = { 't', 'n' }, desc = 'Hide terminal' },
        },
      },
    },
    words = {
      enabled = true,
    },
  },
  keys = {
    { 'gd', mode = 'n', function () require('snacks.picker').lsp_definitions() end, desc = 'Go to definition' },
    { 'gD', mode = 'n', function () require('snacks.picker').lsp_declarations() end, desc = 'Go to declaration' },
    { 'gI', mode = 'n', function () require('snacks.picker').lsp_implementations() end, desc = 'Go to implementation' },
    { 'gr', mode = 'n', function () require('snacks.picker').lsp_references() end, desc = 'Go to references' },
    { 'gt', mode = 'n', function () require('snacks.picker').lsp_type_definitions() end, desc = 'Type definition' },
    { '<leader>e', mode = 'n', function () require('snacks.picker').explorer() end, desc = 'Toggle file tree' },
    { '<leader>fc', mode = 'n', function () require('snacks.picker').git_log() end, desc = 'Find commits' },
    { '<leader>fC', mode = 'n', function () require('snacks.picker').git_log_file() end, desc = 'Find commits' },
    { '<leader>fb', mode = 'n', function () require('snacks.picker').git_branches() end, desc = 'Find branches' },
    { '<leader>fd', mode = 'n', function () require('snacks.picker').diagnostics() end, desc = 'Find diagnostics' },
    { '<leader>fg', mode = 'n', function () require('snacks.picker').git_files() end, desc = 'Find git files' },
    { '<leader>fG', mode = 'n', function () require('snacks.picker').git_status() end, desc = 'Find modified files' },
    { '<leader>fj', mode = 'n', function () require('snacks.picker').jumps() end, desc = 'Jumplist' },
    { '<leader>fn', mode = 'n', function () require('snacks.picker').notifications() end, desc = 'Message history' },
    { '<leader>fm', mode = 'n', function () require('snacks.picker').man() end, desc = 'Find man pages' },
    { '<leader>fs', mode = { 'n', 'x' }, function () require('snacks.picker').grep_word({ hidden = true, ignored = true }) end, desc = 'Find word under cursor' },
    { '<leader>fS', mode = 'n', function () require('snacks.picker').lsp_symbols() end, desc = 'Document symbols' },
    { '<leader>fD', mode = 'n', function () require('snacks.picker').lsp_workspace_symbols() end, desc = 'Workspace symbols' },
    { '<leader>fo', mode = 'n', function () require('snacks.picker').recent() end, desc = 'Find recently opened files' },
    { '<leader>fh', mode = 'n', function () require('snacks.picker').marks() end, desc = 'Find marks' },
    { '<leader>f<CR>', mode = 'n', function () require('snacks.picker').resume() end, desc = 'Resume last search' },
    { '<leader><space>', mode = 'n', function () require('snacks.picker').buffers() end, desc = 'Find existing buffers' },
    { '<leader>ff', mode = 'n', function () require('snacks.picker').files({ hidden = true }) end, desc = 'Find files' },
    { '<leader>fF', mode = 'n', function () require('snacks.picker').files({ hidden = true, ignored = true }) end, desc = 'Find all files' },
    { '<leader>/', mode = 'n', function () require('snacks.picker').grep({ hidden = true }) end, desc = 'Search in files' },
    { '<leader>fw', mode = 'n', function () require('snacks.picker').grep({ hidden = true, ignored = true }) end, desc = 'Search in all files' },
    { '<leader>fb', mode = 'n', function () require('snacks.picker').grep_buffers() end, desc = 'Search in open buffers' },
    { '<leader>ho', mode = 'n', function () require('snacks.gitbrowse').open({ what = 'commit' }) end, desc = 'Open commit url' },
    { '<leader>hf', mode = 'n', function () require('snacks.gitbrowse').open() end, desc = 'Open file url' },
    { '<leader>.', mode = 'n', function () require('snacks').scratch() end, desc = 'Open scratch buffer' },
    { '<leader>n', mode = 'n', function () require('snacks.scratch').select() end, desc = 'Choose scratch buffer' },
    { '<F7>', mode = 'n', function () require('snacks').terminal() end, desc = 'Floating terminal' },
    { '<leader>tl', mode = 'n', function () require('snacks').terminal('lazygit') end, desc = 'Terminal: LazyGit' },
    { '<leader>td', mode = 'n', function () require('snacks').terminal('lazydocker') end, desc = 'Terminal: LazyDocker' },
    { '<leader>tr', mode = 'n', function () require('snacks').terminal('ranger') end, desc = 'Terminal: Ranger' },
    { '<leader>ts', mode = 'n', function () require('snacks').terminal('lftp') end, desc = 'Terminal: LFTP' },
  },
}
