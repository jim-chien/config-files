local status, telescope = pcall(require, 'telescope')
if (not status) then return end

local builtin = require('telescope.builtin')

telescope.setup {
  defaults = {
    preview = {
      treesitter = {
        enable = {
          'css', 'dockerfile',
          'html', 'http', 'javascript', 'json', 'lua',
          'python', 'regex', 'rust', 'scss',
          'typescript', 'vue', 'yaml', 'markdown', 'bash', 'c',
          'comment', 'json5', 'jsonc', 'llvm', 'make', 'jsx',
          'tsx',
        }
      }
    },
  },
  extensions = {
    extensions = {
      fzf = {
        fuzzy = true,                   -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true,    -- override the file sorter
        case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
        -- the default case_mode is "smart_case"
      }
    }
    -- file_browser = {
    --   -- theme = "dropdown",
    --   -- disables netrw and use telescope-file-browser in its place
    --   hijack_netrw = true,
    --   mappings = {
    --     ["i"] = {
    --       -- your custom insert mode mappings
    --     },
    --     ["n"] = {
    --       -- your custom normal mode mappings
    --     },
    --   },
    --   file_ignore_patterns = { 'node_modules' },
    --   display_stat = false,
    --   depth = false
    -- },
  },
}

-- telescope.load_extension("file_browser")

vim.keymap.set('n', '<C-f>', function()
  builtin.live_grep({
    glob_pattern = '!{node_modules,.git,.cache}/**',
  })
end)

vim.keymap.set('n', '<C-p>', builtin.find_files)

vim.keymap.set('n', '<leader>b', function()
  builtin.buffers()
end)

require('telescope').load_extension('fzf')

-- local function telescope_buffer_dir()
--   return vim.fn.expand('%:p:h')
-- end

-- vim.keymap.set("n", "<C-p>", function()
--   telescope.extensions.file_browser.file_browser({
--     path = "%:p:h",
--     cwd = telescope_buffer_dir(),
--     respect_gitignore = false,
--     grouped = true,
--     hidden = true,
--     previewer = false,
--     initial_mode = "normal",
--     layout_config = { height = 40 }
--   })
-- end)
