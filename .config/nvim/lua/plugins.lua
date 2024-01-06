local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"wbthomason/packer.nvim",
	-- Your plugins go here
	-- Appearance
	{
		"folke/tokyonight.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here
			vim.cmd([[colorscheme tokyonight-moon]])
			-- Use terminal background
			vim.cmd("highlight Normal guibg=none guifg=none")
		end,
	},
	"nvim-lualine/lualine.nvim",
	"tpope/vim-commentary",
	"nvim-lua/plenary.nvim", -- Common utilities
	"nvim-telescope/telescope.nvim",
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{ "mg979/vim-visual-multi", branch = "master" },
	"nvim-tree/nvim-tree.lua",
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
	},
	-- Git
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			local status, gitsigns = pcall(require, "gitsigns")
			if not status then
				return
			end
			gitsigns.setup()
		end,
	},
	"tpope/vim-fugitive",
	-- Code LSP, Autocompletion, etc
	{
		"williamboman/mason.nvim",
		dependencies = { "williamboman/mason-lspconfig.nvim" },
		build = function()
			pcall(vim.cmd, "MasonUpdate")
		end,
		config = function()
			-- Setup language servers.
			local mason_status, mason = pcall(require, "mason")
			if not mason_status then
				return
			end
			local mason_lsp_status, mason_lspconfig = pcall(require, "mason-lspconfig")
			if not mason_lsp_status then
				return
			end

			mason.setup({})

			mason_lspconfig.setup({
				ensure_installed = { "lua_ls", "tsserver", "pyright" },
			})
		end,
	},
	{ "neovim/nvim-lspconfig", dependencies = { "nvimdev/lspsaga.nvim" } }, -- Collection of configurations for built-in LSP client
	"hrsh7th/nvim-cmp", -- Autocompletion plugin
	"hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
	"saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
	}, -- Snippets plugin
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })
			pcall(vim.cmd, "TSUpdate")
		end,
	},
	"windwp/nvim-autopairs",
	"windwp/nvim-ts-autotag",
	"nvimtools/none-ls.nvim",
	"lukas-reineke/indent-blankline.nvim",
	"github/copilot.vim",
})
