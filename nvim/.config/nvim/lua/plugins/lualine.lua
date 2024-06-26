-- lualine.lua

local function get_lsps()
  local output = ''
  local clients = vim.lsp.get_clients({
    bufnr = vim.api.nvim_get_current_buf(),
  })

  for i, client in pairs(clients) do
    if i == 1 then
      output = output .. client.name
    else
      output = output .. ', ' .. client.name
    end
  end

  return output
end

local function get_grapple()
  local key = require("grapple").name_or_index()
  return "󰛢 [" .. key .. "]"
end

local function maximize_status()
  return vim.t.maximized and '󰁌' or ''
end

local function pin_status()
  local buf = vim.api.nvim_get_current_buf()
  return require('hbac.state').is_pinned(buf) and '' or ''
end

return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'declancm/maximize.nvim',
    'f-person/git-blame.nvim',
  },
  opts = function (_, opts)
    local gitblame = require 'gitblame'

    opts.options = {
      icons_enabled = true,
      theme = 'catppuccin',
      component_separators = { left = ' ', right = ' '},
      section_separators = { left = '', right = ''},
      always_divide_middle = true,
      disabled_filetypes = {
        statusline = { 'neo-tree' },
      }
    }

    opts.sections = {
      lualine_a = {'mode'},
      lualine_b = {'diff', 'diagnostics'},
      lualine_c = {},
      lualine_x = {
        {
          gitblame.get_current_blame_text,
          cond = gitblame.is_blame_text_available,
        },
        'fileformat',
        'filetype',
      },
      lualine_y = {'progress'},
      lualine_z = {'location'},
    }

    opts.tabline = {
      lualine_a = {'branch'},
      lualine_b = { get_lsps },
      lualine_c = {},
      lualine_x = {
        maximize_status,
        pin_status,
        {
          'filename',
          newfile_status = true,
          symbols = {
            modified = '',
            readonly = '',
          },
        },
      },
      lualine_y = {
        { get_grapple, cond = require('grapple').exists },
      },
      lualine_z = {
        {
          'tabs',
          mode = 1,
          use_mode_colors = true,
          fmt = function (_, context)
            local buflist = vim.fn.tabpagebuflist(context.tabnr)
            local winnr = vim.fn.tabpagewinnr(context.tabnr)
            local bufnr = buflist[winnr]
            local mod = vim.fn.getbufvar(bufnr, '&mod')

            return context.tabnr .. (mod == 1 and ' 󰏪' or '')
          end
        },
      },
    }

    return opts
  end,
}

