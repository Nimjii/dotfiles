-- copilot.lua

return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'InsertEnter',
  opts = {
    copilot_node_command = '/Users/l.spreitzer/.local/share/nvm/v16.20.2/bin/node',
    filetypes = {
      [''] = false,
    },
    panel = {
      enabled = false,
    },
    suggestion = {
      enabled = false,
    },
  },
}