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
  use 'nvim-lua/plenary.nvim'        -- Common utilities
  use 'kyazdani42/nvim-web-devicons' -- File icons
  use 'nvim-telescope/telescope.nvim'
  use { 'mg979/vim-visual-multi', branch = 'master' }
  use 'nvim-tree/nvim-tree.lua'
  -- Git
  use 'airblade/vim-gitgutter'
  use 'tpope/vim-fugitive'
  -- Code LSP, Autocompletion, etc
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'    -- Collection of configurations for built-in LSP client
  use 'hrsh7th/nvim-cmp'         -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp'     -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip'         -- Snippets plugin
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'glepnir/lspsaga.nvim'
end)
