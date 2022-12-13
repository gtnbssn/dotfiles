local null_ls = Prequire("null-ls")
local mason_null_ls = Prequire("mason-null-ls")

if null_ls ~= nil then
	if mason_null_ls ~= nil then
		mason_null_ls.setup()
	end
	-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
	local formatting = null_ls.builtins.formatting
	-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
	local diagnostics = null_ls.builtins.diagnostics

	null_ls.setup({
		debug = false,
		sources = {
			formatting.prettierd.with({
				prefer_local = "node_modules/.bin",
			}),
			formatting.black.with({ extra_args = { "--fast" } }),
			formatting.stylua,
			formatting.shfmt,
			diagnostics.eslint_d.with({
				condition = function(utils)
					return utils.root_has_file(".eslintrc.js") -- change file extension if you use something else
				end,
			}),
		},
	})
end
