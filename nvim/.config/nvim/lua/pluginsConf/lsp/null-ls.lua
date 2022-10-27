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
			formatting.prettier.with({
				prefer_local = "node_modules/.bin",
			}),
			formatting.black.with({ extra_args = { "--fast" } }),
			formatting.stylua,
			formatting.shfmt,
			diagnostics.flake8,
			-- diagnostics.eslint,
		},
	})
end
