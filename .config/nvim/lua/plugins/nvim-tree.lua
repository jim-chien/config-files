vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')

return {
  'nvim-tree/nvim-tree.lua',
  opts = {
    view = {
      side = 'right',
      adaptive_size = true,
    },
    update_focused_file = {
      enable = true,
      update_cwd = true,
    },
    diagnostics = {
      enable = true,
    },
  },
}
