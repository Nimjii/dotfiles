-- @module utils

local M = {}

function M.trim_whitespaces()
  local curpos = vim.api.nvim_win_get_cursor(0)
  vim.cmd([[keeppatterns %s/\s\+$//e]])
  vim.api.nvim_win_set_cursor(0, curpos)
end

function M.trim_empty_lines()
  local n_lines = vim.api.nvim_buf_line_count(0)
  local last_nonblank = vim.fn.prevnonblank(n_lines)
  if last_nonblank < n_lines then
    vim.api.nvim_buf_set_lines(0, last_nonblank, n_lines, true, {})
  end
end

return M
