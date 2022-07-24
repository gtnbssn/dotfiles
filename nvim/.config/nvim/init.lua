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

function Prequire(package)
  local status, lib = pcall(require, package)
  if status then
    return lib
  else
    vim.notify("Failed to require '" .. package .. "' from " .. debug.getinfo(2).source)
    return nil
  end
end

Prequire("impatient")

require("nvimConf.options")
require("nvimConf.keymaps")
require("nvimConf.autocommands")
require("nvimConf.plugins")
