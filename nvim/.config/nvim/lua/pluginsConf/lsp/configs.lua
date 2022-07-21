local lspinstaller_status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not lspinstaller_status_ok then
  vim.notify("lspinstaller did not load", vim.log.levels.WARN)
	return
end

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  vim.notify("lspconfig did not load", vim.log.levels.WARN)
	return
end

local servers = {}
local installedServers = lsp_installer.get_installed_servers()
if installedServers ~= nil then
  for _, server in ipairs(installedServers) do
    table.insert(servers, server.name)
  end
end

lsp_installer.setup({
	ensure_installed = servers,
})

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
