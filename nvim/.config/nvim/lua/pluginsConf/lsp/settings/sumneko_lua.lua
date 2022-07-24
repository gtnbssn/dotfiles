local luadev = Prequire("lua-dev").setup({})

if luadev ~= nil then
	return luadev
end
-- the settings below can be used instead if i ever need to do actual lua and not just nvim configuration
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
