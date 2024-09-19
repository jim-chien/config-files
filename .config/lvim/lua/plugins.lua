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
    "tzachar/cmp-tabnine",
    build = "./install.sh",
    dependencies = "hrsh7th/nvim-cmp",
    event = "InsertEnter",
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
    "zbirenbaum/copilot-cmp",
    event = "InsertEnter",
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
      vim.defer_fn(function()
        require("copilot").setup()     -- https://github.com/zbirenbaum/copilot.lua/blob/master/README.md#setup-and-configuration
        require("copilot_cmp").setup() -- https://github.com/zbirenbaum/copilot-cmp/blob/master/README.md#configuration
      end, 100)
    end,
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
}

-- setup formatting
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup { { name = "prettierd" }, { name = "black" } }

-- setup linting
local linters = require "lvim.lsp.null-ls.linters"
linters.setup { { name = "eslint_d" }, { name = "pylint" } }

-- setup code action
local code_actions = require "lvim.lsp.null-ls.code_actions"
code_actions.setup { { name = "eslint_d" } }
