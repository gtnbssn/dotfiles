local masonlspconfig = Prequire("mason-lspconfig")

local lspconfig = Prequire("lspconfig")

local servers = {}

if masonlspconfig ~= nil then
	local installedServers = masonlspconfig.get_installed_servers()
	if installedServers ~= nil then
		for _, server in ipairs(installedServers) do
			table.insert(servers, server)
		end
	end

	masonlspconfig.setup({
		ensure_installed = servers,
	})
end

local signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "" },
	{ name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local config = {
	virtual_text = false,
	signs = {
		active = signs,
	},
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		focusable = true,
		style = "minimal",
		border = "solid",
		source = "always",
		header = "",
		prefix = "",
	},
}

vim.diagnostic.config(config)

local function cleanhover(_, result, ctx, cleanhoverconfig)
	config = cleanhoverconfig or {}
	config.focus_id = ctx.method
	if not (result and result.contents) then
		return
	end
	local markdown_lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
	markdown_lines = vim.lsp.util.trim_empty_lines(markdown_lines)
	if vim.tbl_isempty(markdown_lines) then
		return
	end
	return vim.lsp.util.open_floating_preview(markdown_lines, "markdown", config)
end

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(cleanhover, {
	border = "solid",
	width = 70,
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "solid",
	width = 70,
})

local function lsp_keymaps(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	vim.keymap.set("n", "gk", vim.lsp.buf.signature_help, opts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "ë", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "ê", vim.diagnostic.goto_next, opts)
	if client.name == "tsserver" then
		vim.keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>")
		vim.keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>")
		vim.keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>")
	end
end

local on_attach = function(client, bufnr)
	lsp_keymaps(client, bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local cmp_nvim_lsp = Prequire("cmp_nvim_lsp")

if cmp_nvim_lsp ~= nil then
	capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

if lspconfig ~= nil then
	for _, server in pairs(servers) do
		local opts = {
			on_attach = on_attach,
			capabilities = capabilities,
		}
		local has_custom_opts, server_custom_opts = pcall(require, "pluginsConf.lsp.settings." .. server)
		if has_custom_opts then
			opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
		end
		if server == "tsserver" then
			Prequire("typescript").setup({
				server = opts,
			})
		else
			lspconfig[server].setup(opts)
		end
	end
end

require("pluginsConf.lsp.null-ls")
