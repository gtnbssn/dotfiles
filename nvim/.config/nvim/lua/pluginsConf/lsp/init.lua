local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("pluginsConf.lsp.lsp-installer")
require("pluginsConf.lsp.handlers").setup()
require("pluginsConf.lsp.null-ls")
