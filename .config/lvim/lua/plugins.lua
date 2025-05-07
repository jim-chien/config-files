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
  },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    opts = {
      -- add any opts here
      -- for example
      provider = "copilot"
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp",              -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua",              -- for file_selector provider fzf
      "nvim-tree/nvim-web-devicons",   -- or echasnovski/mini.icons
      {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
          require("copilot").setup({})
        end,
      },
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "Avante" },
        },
        ft = { "Avante" },
      },
    },
  },
  {
    "j-hui/fidget.nvim",
    opts = {
      notification = {
        window = {
          winblend = 0,
        }
      }
    }
  },
}
lvim.lsp.null_ls.config = function()
  -- enable eslint_d tracking for nvim is running
  vim.env.ESLINT_D_PPID = vim.fn.getpid()
  -- disable error when no eslint
  vim.env.ESLINT_D_MISS = "ignore"
end

-- add `tsserver` to `skipped_servers` list
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "tsserver", "tailwindcss" })
-- remove `vtsls` from `skipped_servers` list
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "vtsls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)
--

local opts = {
  root_markers = { "tsconfig.json", ".git" },
  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = {
          {
            name = "@styled/typescript-styled-plugin",
            location = "/Users/jimchien/.asdf/installs/nodejs/22.14.0/.npm/lib",
            enableForWorkspaceTypeScriptVersions = true
          }
        }
      },
      -- Automatically use workspace version of TypeScript lib on startup.
      autoUseWorkspaceTsdk = true,
      enableMoveToFileCodeAction = true,
      experimental = {
        -- For completion performance.
        completion = {
          enableServerSideFuzzyMatch = true,
          entriesLimit = 20,
        },
      },
    }
  },
}

require("lvim.lsp.manager").setup("vtsls", opts)

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
  require("null-ls.builtins.formatting.prettierd").with({
    prefer_local = 'node_modules/.bin',

  }),
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
