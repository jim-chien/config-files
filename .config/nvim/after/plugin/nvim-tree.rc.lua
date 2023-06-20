local status, tree = pcall(require, 'nvim-tree')
if (not status) then return end

local api = require('nvim-tree.api')

local function on_attach(bufnr)
  -- use all default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- remove a default
  vim.keymap.del('n', 's', { buffer = bufnr })
end

tree.setup {
  on_attach = on_attach,
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
  filters = { custom = { ".DS_Store", ".git" } }
}

vim.g.nvim_tree_respect_buf_cwd = 1

vim.keymap.set('n', '<C-b>', ':NvimTreeToggle<CR>')
