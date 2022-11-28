Utils = {}

function Utils.Prequire(package)
	local status, lib = pcall(require, package)
	if status then
		return lib
	else
		vim.notify("Failed to require '" .. package .. "' from " .. debug.getinfo(2).source)
		return nil
	end
end

return Utils
