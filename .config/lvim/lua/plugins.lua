lvim.plugins = {
  { "folke/tokyonight.nvim" },
  {
    "tpope/vim-fugitive",
    cmd = {
      "G",
      "Git",
      "Gdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
      "GRemove",
      "GRename",
      "Glgrep",
      "Gedit"
    },
    ft = { "fugitive" }
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "Exafunction/codeium.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    event = "InsertEnter",
    config = function()
      require("codeium").setup({
        enable_chat = true
      })
    end
  },
  {
    "stevearc/dressing.nvim",
    config = function()
      require("dressing").setup({
        input = {
          relative = "cursor",
          get_config = function()
            if vim.api.nvim_buf_get_option(0, "filetype") == "NvimTree" then
              return { enabled = false }
            end
          end,
        },
        select = {
          telescope = require("telescope.themes").get_cursor()
        },
      })
    end
  },
  {
    "mistricky/codesnap.nvim",
    build = "make",
    config = function()
      require('codesnap').setup({
        has_breadcrumbs = true,
        watermark = ""
      })
    end
  },
  {
    "nvimtools/none-ls-extras.nvim",
  }
}
lvim.lsp.null_ls.config = function()
  -- enable eslint_d tracking for nvim is running
  vim.env.ESLINT_D_PPID = vim.fn.getpid()
  -- disable error when no eslint
  vim.env.ESLINT_D_MISS = "ignore"
end

-- Helper to conditionally register eslint handlers only if eslint is
-- config. If eslint is not configured for a project, it just fails.
local function has_eslint_config(utils)
  return utils.root_has_file({
    ".eslintrc",
    ".eslintrc.cjs",
    ".eslintrc.js",
    ".eslintrc.json",
    "eslint.config.cjs",
    "eslint.config.js",
    "eslint.config.mjs",
  })
end

-- setup formatting
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  require("null-ls.builtins.formatting.prettierd"),
  { name = "black", filetypes = { "python" } }
}

-- setup linting
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  require("none-ls.diagnostics.eslint_d").with({
    condition = has_eslint_config,
    filetypes = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "vue",
      "svelte",
      "astro",
      "html",
    },
  }),
  { name = "pylint", filetypes = { "python" } }
}

-- setup code action
local code_actions = require "lvim.lsp.null-ls.code_actions"
code_actions.setup {
  require("none-ls.code_actions.eslint_d").with({
    condition = has_eslint_config,
    filetypes = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "vue",
      "svelte",
      "astro",
      "html",
    },
  }),
  { name = "proselint" }
}
