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

local telescope_builtin = require('telescope.builtin')
lvim.lsp.buffer_mappings.normal_mode.gd = { telescope_builtin.lsp_definitions, "Goto definition" }
lvim.lsp.buffer_mappings.normal_mode.gr = { telescope_builtin.lsp_references, "Goto references" }
lvim.lsp.buffer_mappings.normal_mode.gI = { telescope_builtin.lsp_implementations, "Goto Implementation" }
lvim.lsp.buffer_mappings.normal_mode['gt'] = { telescope_builtin.lsp_type_definitions, '[G]oto [T]ype Definition' }

lvim.builtin.which_key.mappings.b.f = {
  "<cmd>Telescope buffers<cr>",
  "Find"
}
