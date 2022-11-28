local scnvim = Prequire("scnvim")

if scnvim ~= nil then
	scnvim.setup()
end

vim.g.scnvim_eval_flash_repeats = 1
vim.g.scnvim_eval_flash_duration = 180
