local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  vim.notify("lspconfig did not load", vim.log.levels.WARN)
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
