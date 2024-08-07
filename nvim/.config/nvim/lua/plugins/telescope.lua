-- telescope.lua

return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  event = 'VeryLazy',
  dependencies = {
    'folke/noice.nvim',
    'gbprod/yanky.nvim',
    'nvim-lua/plenary.nvim',

    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
  },
  config = function ()
    local actions = require('telescope.actions')

    require('telescope').setup({
      defaults = {
        buffer_previewer_maker = require('utils.telescope').previewer_maker,
        path_display = { 'truncate' },
        mappings = {
          i = {
            ['<M-f>'] = actions.nop,
            ['<M-k>'] = actions.nop,
            ['<M-q>'] = actions.nop,
            ['<C-z>'] = actions.send_selected_to_qflist + actions.open_qflist,
          },
          n = {
            ['<M-f>'] = actions.nop,
            ['<M-k>'] = actions.nop,
            ['<M-q>'] = actions.nop,
            ['<C-z>'] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
        preview = {
          mime_hook = function (filepath, bufnr, opts)
            local is_image = function (path)
              local image_extensions = {'gif', 'png', 'jpg', 'jpeg'}
              local split_path = vim.split(path:lower(), '.', { plain = true })
              local extension = split_path[#split_path]

              return vim.tbl_contains(image_extensions, extension)
            end

            if is_image(filepath) then
              local term = vim.api.nvim_open_term(bufnr, {})
              local function send_output(_, data, _)
                for _, d in ipairs(data) do
                  vim.api.nvim_chan_send(term, d .. '\r\n')
                end
              end

              vim.fn.jobstart(
                { 'catimg', filepath },
                { on_stdout = send_output, stdout_buffered = true, pty = true }
              )
            else
              require('telescope.previewers.utils').set_preview_message(bufnr, opts.winid, 'Binary cannot be previewed')
            end
          end
        },
        prompt_prefix = string.format('%s ', ' '),
        selection_caret = string.format('%s ', '❯'),
        file_ignore_patterns = {
          "node_modules/",
          ".git/",
        },
      },
    })

    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'noice')
    pcall(require('telescope').load_extension, 'yank_history')

    local handlers = {
      ['textDocument/declaration'] = require('utils.telescope').location_handler('LSP Declarations'),
      ['textDocument/definition'] = require('utils.telescope').location_handler('LSP Definitions'),
      ['textDocument/implementation'] = require('utils.telescope').location_handler('LSP Implementations'),
      ['textDocument/typeDefinition'] = require('utils.telescope').location_handler('LSP Type Definitions'),
      ['textDocument/references'] = require('utils.telescope').location_handler('LSP References'),
    }

    for req, handler in pairs(handlers) do
      vim.lsp.handlers[req] = handler
    end
  end,
  keys = {
    { 'gd', vim.lsp.buf.definition, desc = 'Go to definition' },
    { 'gD', vim.lsp.buf.declaration, desc = 'Go to declaration' },
    { 'gI', vim.lsp.buf.implementation, desc = 'Go to implementation' },
    { 'gr', vim.lsp.buf.references, desc = 'Go to references' },
    { 'gt', vim.lsp.buf.type_definition, desc = 'Type definition' },
    { '<leader>fc', mode = 'n', function () require('telescope.builtin').git_commits() end, desc = 'Find commits' },
    { '<leader>fb', mode = 'n', function () require('telescope.builtin').git_branches() end, desc = 'Find branches' },
    { '<leader>fd', mode = 'n', function () require('telescope.builtin').diagnostics() end, desc = 'Find diagnostics' },
    { '<leader>fg', mode = 'n', function () require('telescope.builtin').git_files() end, desc = 'Find git files' },
    { '<leader>fG', mode = 'n', function () require('telescope.builtin').git_status() end, desc = 'Find modified files' },
    { '<leader>fj', mode = 'n', function () require('telescope.builtin').jumplist() end, desc = 'Jumplist' },
    { '<leader>fn', mode = 'n', function () require('noice').cmd('telescope') end, desc = 'Message history' },
    { '<leader>fm', mode = 'n', function () require('telescope.builtin').man_pages() end, desc = 'Find man pages' },
    { '<leader>fs', mode = 'n', function () require('telescope.builtin').grep_string() end, desc = 'Find word under cursor' },
    { '<leader>fS', mode = 'n', function () require('telescope.builtin').lsp_document_symbols() end, desc = 'Document symbols' },
    { '<leader>fD', mode = 'n', function () require('telescope.builtin').lsp_dynamic_workspace_symbols() end, desc = 'Workspace symbols' },
    { '<leader>fo', mode = 'n', function () require('telescope.builtin').oldfiles() end, desc = 'Find recently opened files' },
    { '<leader>fh', mode = 'n', function () require('telescope.builtin').marks() end, desc = 'Find marks' },
    { '<leader>fp', mode = 'n', function () require('telescope').extensions.hbac.buffers() end, desc = 'HBAC Buffers' },
    { '<leader>fy', mode = 'n', function () require('telescope').extensions.yank_history.yank_history() end, desc = 'Yank history' },
    { '<leader>f<CR>', mode = 'n', function () require('telescope.builtin').resume() end, desc = 'Resume last search' },
    { '<leader>f<space>', mode = 'n', function () require('utils.telescope').buffers() end, desc = 'Find existing buffers' },
    {
      '<leader>ff',
      mode = 'n',
      function ()
        require('utils.telescope').dir_picker(
          {
            show_preview = true,
            hidden = false,
            no_ignore = false,
          },
          require('telescope.builtin').find_files,
          false
        )
      end,
      desc = 'Find files',
    },
    {
      '<leader>fF',
      mode = 'n',
      function ()
        require('utils.telescope').dir_picker(
          {
            show_preview = true,
            hidden = true,
            no_ignore = true,
            no_ignore_parent = true,
          },
          require('telescope.builtin').find_files,
          false
        )
      end,
      desc = 'Find all files',
    },
    {
      '<leader>fw',
      mode = 'n',
      function ()
        require('utils.telescope').dir_picker(
          {
            show_preview = true,
            hidden = false,
            no_ignore = false,
          },
          require('telescope.builtin').live_grep,
          true
        )
      end,
      desc = 'Search in files',
    },
    {
      '<leader>fW',
      mode = 'n',
      function ()
        require('utils.telescope').dir_picker(
          {
            show_preview = true,
            hidden = true,
            no_ignore = true,
            no_ignore_parent = true,
            additional_args = function (args)
              return vim.list_extend(args, { "--hidden", "--no-ignore" })
            end
          },
          require('telescope.builtin').live_grep,
          true
        )
      end,
      desc = 'Search in all files',
    },
    {
      '<leader>/',
      mode = 'n',
      function ()
        require('telescope.builtin').current_buffer_fuzzy_find(
          require('telescope.themes').get_dropdown {
            winblend = 10,
            previewer = false,
          }
        )
      end,
      desc = 'Fuzzily search in current buffer',
    },
  },
}

