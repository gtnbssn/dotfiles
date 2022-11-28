-- adapted from https://github.com/LunarVim/Neovim-from-scratch

_G.__luacache_config = {
	chunks = {
		enable = true,
		path = vim.fn.stdpath("cache") .. "/luacache_chunks",
	},
	modpaths = {
		enable = true,
		path = vim.fn.stdpath("cache") .. "/luacache_modpaths",
	},
}

Prequire = require("nvimutils").Prequire

Prequire("impatient")

require("nvimConf.options")
require("nvimConf.keymaps")
require("nvimConf.autocommands")
require("nvimConf.plugins")
-- plugins
require("pluginsConf.colorscheme")
require("pluginsConf.nvim-tree")
require("pluginsConf.lualine")
require("pluginsConf.indentline")
require("pluginsConf.whichkey")
require("pluginsConf.zenmode")
require("pluginsConf.leap")
require("pluginsConf.cmp")
require("pluginsConf.mason")
require("pluginsConf.lsp")
require("pluginsConf.illuminate")
require("pluginsConf.telescope")
require("pluginsConf.notify")
require("pluginsConf.comment")
require("pluginsConf.treesitter")
require("pluginsConf.autopairs")
require("pluginsConf.gitsigns")
require("pluginsConf.neodev")
require("pluginsConf.colorizer")
require("pluginsConf.scnvim")
