local lsp_installer = Prequire("nvim-lsp-installer")

local lspconfig = Prequire("lspconfig")

local servers = {}

if lsp_installer ~= nil then
	local installedServers = lsp_installer.get_installed_servers()
	if installedServers ~= nil then
		for _, server in ipairs(installedServers) do
			table.insert(servers, server.name)
		end
	end

	lsp_installer.setup({
		ensure_installed = servers,
	})
end

if lspconfig ~= nil then
	for _, server in pairs(servers) do
		local opts = {
			on_attach = require("pluginsConf.lsp.handlers").on_attach,
			capabilities = require("pluginsConf.lsp.handlers").capabilities,
		}
		local has_custom_opts, server_custom_opts = pcall(require, "pluginsConf.lsp.settings." .. server)
		if has_custom_opts then
			opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
		end
		lspconfig[server].setup(opts)
	end
end
