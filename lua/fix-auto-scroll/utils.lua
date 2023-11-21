local M = {
  SESSION = {
    saved_buff_view = {}
  }
}

-- Code based on: https://vim.fandom.com/wiki/Avoid_scrolling_when_switch_buffers#:~:text=When%20switching%20buffers%20using%20the,line%20relative%20to%20the%20screen.

function M.save_win_view()
  local win_id = vim.fn.win_getid()
  if not M.SESSION.saved_buff_view[win_id] then
    M.SESSION.saved_buff_view[win_id] = {}
  end
  M.SESSION.saved_buff_view[win_id][vim.fn.bufnr("%")] = vim.fn.winsaveview()
  -- M.log('Saving win view')
end

function M.restore_win_view()
  local buf = vim.fn.bufnr("%")
  local win_id = vim.fn.win_getid()
  if M.SESSION.saved_buff_view[win_id] and M.SESSION.saved_buff_view[win_id][buf] then
    local v = vim.fn.winsaveview()
    if v.lnum == 1 and v.col == 0 and not vim.api.nvim_get_option_value('diff', {}) then
      vim.fn.winrestview(M.SESSION.saved_buff_view[win_id][buf])
    end
    -- M.log('Restoring win view ' .. buf)
    M.SESSION.saved_buff_view[win_id][buf] = nil
  end
end

return M
