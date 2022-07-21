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

local status_ok, impatient = pcall(require, "impatient")
if not status_ok then
	vim.notify("impatient did not load", vim.log.levels.WARN)
	return
-- else
--   impatient.enable_profile()
end

require("nvimConf.options")
require("nvimConf.keymaps")
require("nvimConf.autocommands")
require("nvimConf.plugins")
