-- adapted from https://github.com/LunarVim/Neovim-from-scratch
local status_ok, _ = pcall(require, "impatient")
if not status_ok then
	vim.notify("impatient did not load", vim.log.levels.WARN)
	return
end
require "nvimConf.options"
require "nvimConf.keymaps"
require "nvimConf.autocommands"
require "nvimConf.plugins"
require "nvimConf.colorscheme"
