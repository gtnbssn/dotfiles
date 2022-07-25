-- local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
-- if not lspconfig_status_ok then
--   vim.notify("lspconfig did not load", vim.log.levels.WARN)
-- 	return
-- end

require("pluginsConf.lsp.configs")
require("pluginsConf.lsp.handlers").setup()
require("pluginsConf.lsp.null-ls")
