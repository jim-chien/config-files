local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

keymap('n', 'sw', '<C-w>w', opts)
keymap('n', 'ss', ':split<Return><C-w>w', opts)
keymap('n', 'sv', ':vsplit<Return><C-w>w', opts)

-- Prevent delete from overriding what's in the clipboard
keymap('n', 'd', '"_d', opts)
keymap('v', 'd', '"_d', opts)

-- Prevent x and the delete key from overriding what's in the clipboard.
keymap('n', 'x', '"_x', opts)
keymap('n', 'X', '"_x', opts)
keymap('n', '<Del>', '"_x', opts)
keymap('v', 'x', '"_x', opts)
keymap('v', 'X', '"_x', opts)
keymap('v', '<Del>', '"_x', opts)

-- Prevent pasting in visual from overriding what's in the clipboard
keymap('x', 'p', 'pgvy', opts)
