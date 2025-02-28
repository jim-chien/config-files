lvim.colorscheme = "tokyonight-moon"
lvim.transparent_window = true
lvim.format_on_save.enabled = true
lvim.builtin.telescope.theme = "dropdown"
lvim.builtin.telescope.defaults.layout_strategy = 'horizontal'
lvim.builtin.telescope.defaults.layout_config.height = 0.9
lvim.builtin.telescope.defaults.layout_config.width = 0.8
lvim.builtin.telescope.defaults.border = true
lvim.builtin.telescope.defaults.borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }
lvim.builtin.telescope.pickers.find_files = {
  find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
}
lvim.builtin.which_key.mappings.b.f = {
  "<cmd>Telescope buffers<cr>",
  "Find"
}
lvim.builtin.nvimtree.setup.view.side = 'right'
lvim.builtin.nvimtree.setup.view.adaptive_size = true

-- vim.list_extend(lvim.builtin.cmp.sources, {
--   {
--     name = "codeium",
--     max_item_count = 3,
--     priority = 10,
--   }
-- })
-- lvim.builtin.cmp.formatting.source_names['codeium'] = "(Codeium)"
