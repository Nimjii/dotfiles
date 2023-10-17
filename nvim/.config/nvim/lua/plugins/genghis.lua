-- ghengis.lua

return {
  'chrisgrieser/nvim-genghis',
  dependencies = {
    'stevearc/dressing.nvim',
  },
  keys = {
    { '<leader>Fd', mode = 'n', function () require('genghis').duplicateFile() end, desc = 'Duplicate file' },
    { '<leader>Fm', mode = 'n', function () require('genghis').moveAndRenameFile() end, desc = 'Move and rename file' },
    { '<leader>Fn', mode = 'n', function () require('genghis').createNewFile() end, desc = 'Create a new file' },
    { '<leader>Fr', mode = 'n', function () require('genghis').renameFile() end, desc = 'Rename file' },
    { '<leader>Ft', mode = 'n', function () require('genghis').trashFile() end, desc = 'Trash file' },
    { '<leader>Fx', mode = 'n', function () require('genghis').chmodx() end, desc = 'Make file executable' },
    { '<leader>Fy', mode = 'n', function () require('genghis').copyFilename() end, desc = 'Copy filename' },
    { '<leader>FY', mode = 'n', function () require('genghis').copyFilepath() end, desc = 'Copy filepath' },
    { '<leader>Fx', mode = 'x', function () require('genghis').moveSelectionToNewFile() end, desc = 'Move selection to new file' },
  },
}
