-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter', 'VimResume', 'WinEnter', 'CursorHold' }, {
  group = vim.api.nvim_create_augroup('checktime', { clear = true }),
  callback = function()
    if vim.o.buftype ~= 'nofile' then
      vim.cmd 'checktime'
    end
  end,
})
