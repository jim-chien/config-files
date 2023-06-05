local status, tree = pcall(require, 'nvim-tree')
if (not status) then return end

tree.setup {
  disable_netrw = true,
  hijack_netrw = true,
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  git = {
    enable = false
  },
  renderer = {
    add_trailing = true,
    indent_markers = {
      enable = true,
    }
  },
  filters = { custom = { ".DS_Store" } }
}

vim.g.nvim_tree_respect_buf_cwd = 1

vim.keymap.set('n', '<C-b>', ':NvimTreeToggle<CR>')
