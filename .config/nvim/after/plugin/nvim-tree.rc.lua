local status, tree = pcall(require, "nvim-tree")
if not status then
  return
end

local api = require("nvim-tree.api")

local function on_attach(bufnr)
  -- use all default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- remove a default
  vim.keymap.del("n", "s", { buffer = bufnr, noremap = true, silent = true, nowait = true })
end

tree.setup({
  on_attach = on_attach,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  diagnostics = {
    enable = true,
  },
  renderer = {
    add_trailing = true,
    group_empty = false,
    highlight_git = true,
    full_name = false,
    highlight_opened_files = "none",
    root_folder_label = ":t",
    indent_width = 2,
    indent_markers = {
      enable = false,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        none = " ",
      },
    },
  },
  view = {
    centralize_selection = true,
    width = 40,
  },
})

vim.g.nvim_tree_respect_buf_cwd = 1

vim.keymap.set("n", "<C-b>", ":NvimTreeToggle<CR>")
