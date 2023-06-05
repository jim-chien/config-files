local status, saga = pcall(require, 'lspsaga')
if (not status) then return end

saga.setup()

local diagnostic = require('lspsaga.diagnostic')
local opts = { noremap = true, silent = true }
vim.keymap.set('n', 'gl', '<Cmd>Lspsaga show_line_diagnostics<CR>', opts)
vim.keymap.set("n", "gy", "<cmd>Lspsaga peek_type_definition<CR>")
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', opts)
vim.keymap.set('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>', opts)
vim.keymap.set('n', '<leader>rn', '<Cmd>Lspsaga rename<CR>', opts)
vim.keymap.set("n", "[g", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
vim.keymap.set("n", "]g", "<cmd>Lspsaga diagnostic_jump_next<CR>")

-- code action
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>a', '<Cmd>Lspsaga code_action<CR>')
