local configs = Prequire("nvim-treesitter.configs")

if configs ~= nil then
	configs.setup({
		ensure_installed = "all", -- "all" or a list of languages
		sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
		ignore_install = { "" }, -- List of parsers to ignore installing
		autopairs = {
			enable = true,
		},
		highlight = {
			enable = true, -- false will disable the whole extension
			disable = { "" }, -- list of language that will be disabled
			additional_vim_regex_highlighting = false,
		},
		indent = { enable = true, disable = { "yaml" } },
		context_commentstring = {
			enable = true,
			enable_autocmd = false,
		},
		autotag = {
			enable = true,
		},
	})

	vim.opt.foldmethod = "expr"
	vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
end
