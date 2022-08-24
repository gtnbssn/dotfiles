vim.api.nvim_create_augroup("generalSettings", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "qf", "help", "man", "lspinfo" },
	command = "nnoremap <silent> <buffer> q :close<cr>",
	group = "generalSettings",
})
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = "generalSettings",
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = "qf",
	callback = function()
		vim.opt.buflisted = false
	end,
	group = "generalSettings",
})
vim.api.nvim_create_autocmd("BufWinEnter", {
	callback = function()
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
	group = "generalSettings",
})

vim.api.nvim_create_augroup("cursorLine", { clear = true })
vim.api.nvim_create_autocmd({ "VimEnter", "WinEnter", "BufWinEnter" }, {
	callback = function()
		vim.opt_local.cursorline = true
	end,
	group = "cursorLine",
})
vim.api.nvim_create_autocmd("WinLeave", {
	callback = function()
		vim.opt_local.cursorline = false
	end,
	group = "cursorLine",
})

vim.api.nvim_create_augroup("redactional", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
	group = "redactional",
})

vim.api.nvim_create_augroup("autoResize", { clear = true })
vim.api.nvim_create_autocmd("VimResized", {
	command = "tabdo wincmd =",
	group = "autoResize",
})

vim.api.nvim_create_augroup("vertHelp", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.txt",
	command = "if &buftype == 'help' | wincmd L | endif",
	group = "vertHelp",
})
