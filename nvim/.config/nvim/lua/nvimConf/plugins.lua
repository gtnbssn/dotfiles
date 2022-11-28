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

		-- Colorschemes
		use("EdenEast/nightfox.nvim")
		use("olimorris/onedarkpro.nvim")
		use("ellisonleao/gruvbox.nvim")

		use("kyazdani42/nvim-web-devicons")

		use("kyazdani42/nvim-tree.lua")

		use("moll/vim-bbye")

		use("nvim-lualine/lualine.nvim")

		use("lukas-reineke/indent-blankline.nvim")

		use("folke/which-key.nvim")

		use("folke/zen-mode.nvim")

		use("ggandor/leap.nvim")

		-- needed for leap otherwise errors on dot repeat after a ct
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

		-- LSP
		use("neovim/nvim-lspconfig") -- enable LSP
		use({ "williamboman/mason.nvim" })
		use({ "williamboman/mason-lspconfig.nvim" })
		use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
		use("jayp0521/mason-null-ls.nvim")
		use("jose-elias-alvarez/typescript.nvim")
		use("b0o/schemastore.nvim")
		use("RRethy/vim-illuminate")

		-- Telescope
		use("nvim-telescope/telescope.nvim")
		use({
			"nvim-telescope/telescope-fzf-native.nvim",
			run = "make",
		})

		use("rcarriga/nvim-notify")

		use("numToStr/Comment.nvim") -- Easily comment stuff
		use("JoosepAlviste/nvim-ts-context-commentstring")

		-- Treesitter
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
		})
		use("nvim-treesitter/nvim-treesitter-context")
		-- autotag
		use("windwp/nvim-ts-autotag")
		use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter

		-- Git
		use("lewis6991/gitsigns.nvim")

		use("folke/neodev.nvim")

		use("NvChad/nvim-colorizer.lua")

		-- scnvim
		use("davidgranstrom/scnvim")
		-- TODO 'quangnguyen30192/cmp-nvim-tags' for supercollider autocomplete ?

		-- Automatically set up your configuration after cloning packer.nvim
		-- Put this at the end after all plugins
		if PACKER_BOOTSTRAP then
			Prequire("packer").sync()
		end
	end)
end
