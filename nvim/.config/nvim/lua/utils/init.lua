-- @module utils

local M = {}

function M.is_large_file(bufnr)
  local max_filesize = 100 * 2048
  local fd_ok, fd = pcall(vim.loop.fs_open, vim.api.nvim_buf_get_name(bufnr), 'r', 438)
  local stats_ok, stats = pcall(vim.loop.fs_fstat, fd)

  pcall(vim.loop.fs_close, fd)

  if fd_ok and stats_ok and stats and stats.size > max_filesize then
    return true
  end
  return false
end

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
