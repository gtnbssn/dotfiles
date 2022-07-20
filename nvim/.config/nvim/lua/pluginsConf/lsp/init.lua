local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("pluginsConf.lsp.lsp-installer")
require("pluginsConf.lsp.handlers").setup()
require("pluginsConf.lsp.null-ls")

lspconfig.jsonls.setup {
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
    },
  },
}
