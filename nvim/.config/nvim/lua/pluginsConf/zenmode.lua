local zenmode = Prequire("zen-mode")

if zenmode ~= nil then
	zenmode.setup({
		window = {
			backdrop = 1.0,
			width = 100,
		},
	})
end
