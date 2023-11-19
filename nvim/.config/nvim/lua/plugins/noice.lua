-- noice.lua

return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  },
  opts = function (_, opts)
    vim.keymap.set({"n", "i", "s"}, "<C-f>", function()
      if not require("noice.lsp").scroll(4) then
        return "<C-f>zz"
      end
    end, { silent = true, expr = true })

    vim.keymap.set({"n", "i", "s"}, "<C-d>", function()
      if not require("noice.lsp").scroll(-4) then
        return "<C-d>zz"
      end
    end, { silent = true, expr = true })

    return vim.tbl_deep_extend('force', opts, {
      cmdline = {
        format = {
          search_down = { icon = ' ' },
          search_up = { icon = ' ' },
        },
      },
      lsp = {
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true,
        },
      },
      messages = {
        view = 'mini',
      },
      presets = {
        command_palette = true,
        long_message_to_split = true,
        inc_rename = true,
        lsp_doc_border = true,
      },
      routes = {
        {
          filter = { max_width = 0 },
          opts = { skip = true },
        },
      },
      views = {
        cmdline_popup = {
          filter_options = {},
          position = {
            col = '50%',
            row = '40%',
          },
        },
        popup = {
          win_options = {
            winhighlight = {
              Normal = 'Normal',
              FloatBorder = 'FloatBorder',
            },
          },
        },
      },
    })
  end,
}

