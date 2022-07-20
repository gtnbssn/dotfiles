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
    autocmd BufWritePost nvimConf.plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	vim.notify("packer did not load", vim.log.levels.WARN)
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	use("wbthomason/packer.nvim") -- Have packer manage itself
	-- use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
  use("lewis6991/impatient.nvim")
	use("nvim-lua/plenary.nvim") -- Useful lua functions used by lots of plugins

	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
	require("pluginsConf.autopairs")

	use("numToStr/Comment.nvim") -- Easily comment stuff
	require("pluginsConf.comment")

	use("kyazdani42/nvim-web-devicons")

	use("kyazdani42/nvim-tree.lua")
	require("pluginsConf.nvim-tree")

	use("moll/vim-bbye")

	use("nvim-lualine/lualine.nvim")
	require("pluginsConf.lualine")

	-- use("akinsho/toggleterm.nvim")
	-- require("pluginsConf.toggleterm")

	use("lukas-reineke/indent-blankline.nvim")
	require("pluginsConf.indentline")

	-- use("antoinemadec/FixCursorHold.nvim") -- This is needed to fix lsp doc highlight

	use("folke/which-key.nvim")
	require("pluginsConf.whichkey")

	use("Pocco81/TrueZen.nvim")
	require("pluginsConf.truezen")

	use("ggandor/lightspeed.nvim") -- check out https://github.com/ggandor/leap.nvim to switch when it becomes mature
	require("pluginsConf.lightspeed")

	-- Colorschemes
	use("ellisonleao/gruvbox.nvim")
	-- use({ "gruvbox-community/gruvbox" })

	use("rcarriga/nvim-notify")
	vim.notify = require("notify")

	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")
	require("pluginsConf.cmp")

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer
	use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
	use("b0o/schemastore.nvim")
	use("RRethy/vim-illuminate")
	require("pluginsConf.lsp")

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
		config = function()
			local ft_to_parser = require("nvim-treesitter.parsers").filetype_to_parsername
			ft_to_parser.astro = "tsx"
		end,
	})
	use("JoosepAlviste/nvim-ts-context-commentstring")
	require("pluginsConf.treesitter")

	-- Git
	use("lewis6991/gitsigns.nvim")
	require("pluginsConf.gitsigns")

	-- rest.nvim
	-- use({
	-- 	"NTBBloodbath/rest.nvim",
	-- 	config = function()
	-- 		require("rest-nvim").setup()
	-- 	end,
	-- })

	-- use("Glench/Vim-Jinja2-Syntax")

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
		require("packer").sync()
	end
end)
