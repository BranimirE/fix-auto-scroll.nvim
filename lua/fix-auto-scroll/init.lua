local utils = require('fix-auto-scroll.utils')
local M = {}

---@diagnostic disable-next-line: unused-local
function M.setup(opts)
  local AutoSaveViewGroup = vim.api.nvim_create_augroup('AutoSaveViewGroup', {})
  vim.api.nvim_create_autocmd('BufEnter', {
    group = AutoSaveViewGroup,
    pattern = '*',
    callback = function()
      utils.restore_win_view()
    end
  })
  vim.api.nvim_create_autocmd('BufLeave', {
    group = AutoSaveViewGroup,
    pattern = '*',
    callback = function()
      utils.save_win_view()
    end
  })
end

return M
