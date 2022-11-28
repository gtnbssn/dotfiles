local illuminate = Prequire("illuminate")

if illuminate ~= nil then
	illuminate.configure({ filetypes_denylist = { "NvimTree", "mason", "packer" } })
end
