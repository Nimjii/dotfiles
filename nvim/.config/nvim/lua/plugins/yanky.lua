-- yanky.lua

return {
  'gbprod/yanky.nvim',
  opts = {
    highlight = {
      on_put = false,
      on_yank = false,
    },
    ring = {
      history_length = 50,
      cancel_event = 'move',
    },
  },
  keys = {
    { 'y', mode = { 'n', 'x' }, '<Plug>(YankyYank)', desc = 'Yanky yank' },
    { 'p', mode = { 'n', 'x' }, '<Plug>(YankyPutAfter)', desc = 'Yanky put after' },
    { 'P', mode = { 'n', 'x' }, '<Plug>(YankyPutBefore)', desc = 'Yanky put before' },
    { 'gp', mode = { 'n', 'x' }, '<Plug>(YankyGPutAfter)', desc = 'Yanky gput after' },
    { 'gP', mode = { 'n', 'x' }, '<Plug>(YankyGPutBefore)', desc = 'Yanky gput before' },
    { '<c-n>', mode = { 'n' }, '<Plug>(YankyCycleForward)', desc = 'Yanky cycle forward' },
    { '<c-p>', mode = { 'n' }, '<Plug>(YankyCycleBackward)', desc = 'Yanky cycle backward' },
    { ']p', mode = { 'n' }, '<Plug>(YankyPutIndentAfterLinewise)', desc = 'Yanky put indent after (linewise)' },
    { '[p', mode = { 'n' }, '<Plug>(YankyPutIndentBeforeLinewise)', desc = 'Yanky put indent before (linewise)' },
    { ']P', mode = { 'n' }, '<Plug>(YankyPutIndentAfterLinewise)', desc = 'Yanky put indent after (linewise)' },
    { '[P', mode = { 'n' }, '<Plug>(YankyPutIndentBeforeLinewise)', desc = 'Yanky put indent before (linewise)' },
    { '>p', mode = { 'n' }, '<Plug>(YankyPutIndentAfterShiftRight)', desc = 'Yanky put indent after (shift right)' },
    { '<p', mode = { 'n' }, '<Plug>(YankyPutIndentBeforeShiftRight)', desc = 'Yanky put indent before (shift right)' },
    { '>P', mode = { 'n' }, '<Plug>(YankyPutIndentAfterShiftLeft)', desc = 'Yanky put indent after (shift left)' },
    { '<P', mode = { 'n' }, '<Plug>(YankyPutIndentBeforeShiftLeft)', desc = 'Yanky put indent before (shift left)' },
    { '=p', mode = { 'n' }, '<Plug>(YankyPutAfterJoined)', desc = 'Yanky put after (joined)' },
    { '=P', mode = { 'n' }, '<Plug>(YankyPutBeforeJoined)', desc = 'Yanky put before (joined)' },
  },
}
