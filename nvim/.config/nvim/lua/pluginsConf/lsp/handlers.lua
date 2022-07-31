local M = {}

-- TODO: backfill this to template
M.setup = function()
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
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
		width = 60,
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
		width = 60,
	})
end

--[[ local function lsp_highlight_document(client)
  local status_ok, illuminate = pcall(require, "illuminate")
  if not status_ok then
  vim.notify("illuminate did not load in lsp.handlers", vim.log.levels.WARN)
    return
  end
  vim.g.Illuminate_ftblacklist = {'NvimTree'}
  illuminate.on_attach(client)
end ]]

local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "ë", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "ê", vim.diagnostic.goto_next, opts)
	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
end

local illuminate = Prequire("illuminate")

local function lsp_highlight_document(client)
	if illuminate ~= nil then
		vim.g.Illuminate_ftblacklist = { "NvimTree" }
		illuminate.on_attach(client)
	end
end

M.on_attach = function(client, bufnr)
	-- this can be useful for debugging but otherwise it's annoying
	-- vim.notify("starting "..client.name)
	-- these will disable formatting, so that null-ls will pick it up without asking
	if client.name == "tsserver" then
		client.resolved_capabilities.document_formatting = false
	end
	if client.name == "sumneko_lua" then
		client.resolved_capabilities.document_formatting = false
	end
	lsp_keymaps(bufnr)
	lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local cmp_nvim_lsp = Prequire("cmp_nvim_lsp")

if cmp_nvim_lsp ~= nil then
	M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
end

return M
