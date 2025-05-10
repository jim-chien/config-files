vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

local opts = { noremap = true, silent = true }

vim.keymap.set('n', 'sw', '<C-w>w', opts)
vim.keymap.set('n', 'ss', ':split<Return><C-w>w', opts)
vim.keymap.set('n', 'sv', ':vsplit<Return><C-w>w', opts)

-- Prevent delete from overriding what's in the clipboard
vim.keymap.set({ 'n', 'v' }, 'd', '"_d', opts)

-- Prevent x and the delete key from overriding what's in the clipboard.
vim.keymap.set({ 'n', 'v' }, 'x', '"_x', opts)
vim.keymap.set({ 'n', 'v' }, 'X', '"_x', opts)
vim.keymap.set({ 'n', 'v' }, '<Del>', '"_x', opts)

-- Prevent pasting in visual from overriding what's in the clipboard
vim.keymap.set('x', 'p', 'pgvy', opts)

vim.keymap.set('n', '<leader>w', '<Cmd>w!<CR>', vim.list_extend(opts, { desc = 'Save' }))

-- Move visual block
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", opts)
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", opts)

-- Move normal block
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', opts)
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', opts)

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
