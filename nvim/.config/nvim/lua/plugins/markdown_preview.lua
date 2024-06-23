-- markdown_preview.lua

return {
  'iamcco/markdown-preview.nvim',
  build = 'cd app && npm install',
  ft = 'markdown',
  keys = {
   { '<leader>Fp', mode = { 'n' }, '<cmd>MarkdownPreviewToggle<cr>', desc = 'Markdown preview' },
  },
}
