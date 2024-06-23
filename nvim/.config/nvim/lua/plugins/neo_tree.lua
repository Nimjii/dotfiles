-- neo_tree.lua

return {
  'nvim-neo-tree/neo-tree.nvim', 
  branch = "v3.x",
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  init = function () vim.g.neo_tree_remove_legacy_commands = true end,
  opts = {
    auto_clean_after_session_restore = true,
    close_if_last_window = true,
    enable_diagnostics = true,
    sources = { 'filesystem' },
    source_selector = {
      content_layout = "center",
      sources = {
        { source = "filesystem", display_name = " File" },
      },
    },
    default_component_configs = {
      indent = {
        indent_size = 2,
        padding = 0,
      },
      icon = {
        folder_closed = '',
        folder_open = '',
        folder_empty = '',
        folder_empty_open = '',
        default = '󰈙',
      },
      modified = {
        symbol = '󰏪',
      },
      name = {
        use_git_status_colors = true,
      },
      git_status = {
        symbols = {
          added = '',
          deleted = '',
          modified = '',
          renamed = '➜',
          untracked = '★',
          ignored = '◌',
          unstaged = '✗',
          staged = '✓',
          conflict = '',
        },
      },
    },
    commands = {
      system_open = function(state)
        vim.ui.open(state.tree:get_node():get_id())
      end,
      parent_or_close = function(state)
        local node = state.tree:get_node()
        if (node.type == "directory" or node:has_children()) and node:is_expanded() then
          state.commands.toggle_node(state)
        else
          require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
        end
      end,
      child_or_open = function(state)
        local node = state.tree:get_node()
        if node.type == "directory" or node:has_children() then
          if not node:is_expanded() then
            state.commands.toggle_node(state)
          else
            require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
          end
        else
          state.commands.open(state)
        end
      end,
    },
    window = {
      width = 50,
      mappings = {
        ["<space>"] = false, -- disable space until we figure out which-key disabling
        ["[b"] = "prev_source",
        ["]b"] = "next_source",
        O = "system_open",
        h = "parent_or_close",
        l = "child_or_open",
        o = "open",
      },
      fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
        ["<C-j>"] = "move_cursor_down",
        ["<C-k>"] = "move_cursor_up",
      },
    },
    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = false,
        never_show = {
          '.DS_Store',
        },
      },
      follow_current_file = { enabled = true },
      hijack_netrw_behavior = "open_current",
      use_libuv_file_watcher = true,
    },
    event_handlers = {
      {
        event = "neo_tree_buffer_enter",
        handler = function(_) vim.opt_local.signcolumn = "auto" end,
      },
    },
  },
  keys = {
    { '<leader>e', mode = 'n', '<cmd>Neotree current toggle reveal<cr>', desc = 'Toggle NeoTree' },
  },
}
