local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd([[
  packadd packer.nvim
]])

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  -- Your plugins go here
  -- Appearance
  use 'nvim-lualine/lualine.nvim'
  use 'folke/tokyonight.nvim'
  use 'tpope/vim-commentary'
  use 'nvim-lua/plenary.nvim' -- Common utilities
  use 'nvim-telescope/telescope.nvim'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use { 'mg979/vim-visual-multi', branch = 'master' }
  use 'nvim-tree/nvim-tree.lua'
  use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }
  -- Git
  use 'airblade/vim-gitgutter'
  use 'tpope/vim-fugitive'
  -- Code LSP, Autocompletion, etc
  use {
    'williamboman/mason.nvim',
    requires = { 'williamboman/mason-lspconfig.nvim' },
    run = function()
      pcall(vim.cmd, 'MasonUpdate')
    end,
    config = function()
      -- Setup language servers.
      local mason_status, mason = pcall(require, "mason")
      if (not mason_status) then return end
      local mason_lsp_status, mason_lspconfig = pcall(require, "mason-lspconfig")
      if (not mason_lsp_status) then return end

      mason.setup({})

      mason_lspconfig.setup {
        ensure_installed = { "lua_ls", "tsserver", "pyright" }
      }
    end }
  use 'neovim/nvim-lspconfig'    -- Collection of configurations for built-in LSP client
  use 'hrsh7th/nvim-cmp'         -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp'     -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use {
    "L3MON4D3/LuaSnip",
    requires = { "rafamadriz/friendly-snippets" },
  } -- Snippets plugin
  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
    run = function()
      require('nvim-treesitter.install').update({ with_sync = true })
      pcall(vim.cmd, 'TSUpdate')
    end,
  }
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'
  use({
    'nvimdev/lspsaga.nvim',
    after = 'nvim-lspconfig'
  })
  use 'github/copilot.vim'
end)
