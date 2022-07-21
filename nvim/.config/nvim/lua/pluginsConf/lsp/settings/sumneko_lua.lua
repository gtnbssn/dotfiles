local luadev = require("lua-dev").setup({})
return luadev
-- the settings below can be used if i ever need to do actual lua and not just nvim configuration
-- return {
-- 	settings = {
--
-- 		Lua = {
-- 			diagnostics = {
-- 				globals = { "vim" },
-- 			},
-- 			workspace = {
-- 				library = {
-- 					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
-- 					[vim.fn.stdpath("config") .. "/lua"] = true,
-- 				},
-- 			},
-- 		},
-- 	},
-- }
