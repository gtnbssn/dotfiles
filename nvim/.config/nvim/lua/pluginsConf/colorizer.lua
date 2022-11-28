local colorizer = Prequire("colorizer")

if colorizer ~= nil then
	colorizer.setup({
		filetypes = { "*", "!help", "!NvimTree", "!packer", "!mason" },
		user_default_options = { mode = "virtualtext" },
	})
end
