local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local packer = Prequire("packer")

if packer ~= nil then
	-- Have packer use a popup window
	packer.init({
		display = {
			open_fn = function()
				return Prequire("packer.util").float({ border = "solid" })
			end,
		},
	})

	-- Install your plugins here
	return packer.startup(function(use)
		use("wbthomason/packer.nvim") -- Have packer manage itself
		-- use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
		use("lewis6991/impatient.nvim")
		use("nvim-lua/plenary.nvim") -- Useful lua functions used by lots of plugins

		use("rcarriga/nvim-notify")
		vim.notify = Prequire("notify")
		vim.notify.setup({
			timeout = 7000,
		})

		-- Colorschemes
		use("EdenEast/nightfox.nvim")
		use({
			"rose-pine/neovim",
			as = "rose-pine",
			tag = "v1.*",
		})
		require("pluginsConf.colorscheme")

		use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
		require("pluginsConf.autopairs")

		use("numToStr/Comment.nvim") -- Easily comment stuff
		use("JoosepAlviste/nvim-ts-context-commentstring")
		require("pluginsConf.comment")

		use("kyazdani42/nvim-web-devicons")

		use("kyazdani42/nvim-tree.lua")
		require("pluginsConf.nvim-tree")

		use("moll/vim-bbye")

		use("nvim-lualine/lualine.nvim")
		require("pluginsConf.lualine")

		use("lukas-reineke/indent-blankline.nvim")
		require("pluginsConf.indentline")

		use("folke/which-key.nvim")
		require("pluginsConf.whichkey")

		use({
			"folke/zen-mode.nvim",
			config = function()
				Prequire("zen-mode").setup({
					window = {
						backdrop = 1.0,
						width = 100,
					},
				})
			end,
		})

		use("ggandor/lightspeed.nvim") -- check out https://github.com/ggandor/leap.nvim to switch when it becomes mature
		require("pluginsConf.lightspeed")

		-- needed for lightspeed otherwise errors on dot repeat after a ct
		use("tpope/vim-repeat")

		-- cmp plugins
		use("hrsh7th/nvim-cmp") -- The completion plugin
		use("hrsh7th/cmp-buffer") -- buffer completions
		use("hrsh7th/cmp-path") -- path completions
		use("hrsh7th/cmp-cmdline") -- cmdline completions
		use("saadparwaiz1/cmp_luasnip") -- snippet completions
		use("hrsh7th/cmp-nvim-lsp")
		-- snippets
		use("L3MON4D3/LuaSnip") --snippet engine
		use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

		require("pluginsConf.cmp")

		-- LSP
		use("neovim/nvim-lspconfig") -- enable LSP
		use({ "williamboman/mason.nvim" })
		require("mason").setup()
		use({ "williamboman/mason-lspconfig.nvim" })
		use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
		use("b0o/schemastore.nvim")
		require("pluginsConf.lsp")
		use("RRethy/vim-illuminate")
		-- require('illuminate').configure({ filetypes_denylist = { "NvimTree" } })

		-- autotag
		use("windwp/nvim-ts-autotag")

		-- Telescope
		use("nvim-telescope/telescope.nvim")
		use({
			"nvim-telescope/telescope-fzf-native.nvim",
			run = "make",
		})
		require("pluginsConf.telescope")

		-- Treesitter
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
		})
		require("pluginsConf.treesitter")

		-- Git
		use("lewis6991/gitsigns.nvim")
		require("pluginsConf.gitsigns")

		use("folke/lua-dev.nvim")

		use("NvChad/nvim-colorizer.lua")
		require("colorizer").setup({ "*" }, { mode = "virtualtext" })

		-- scnvim
		use({
			"davidgranstrom/scnvim",
			run = ":call scnvim#install()",
		})
		require("pluginsConf.scnvim")
		-- TODO 'quangnguyen30192/cmp-nvim-tags' for supercollider autocomplete ?

		-- Automatically set up your configuration after cloning packer.nvim
		-- Put this at the end after all plugins
		if PACKER_BOOTSTRAP then
			Prequire("packer").sync()
		end
	end)
end
