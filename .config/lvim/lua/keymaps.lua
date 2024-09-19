local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

keymap('n', 'sw', '<C-w>w', opts)
keymap('n', 'ss', ':split<Return><C-w>w', opts)
keymap('n', 'sv', ':vsplit<Return><C-w>w', opts)
