local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = true,
	update_in_insert = false,
	always_visible = true,
}

-- use gitsigns as the source for diff so that both are in sync: https://github.com/nvim-lualine/lualine.nvim/wiki/Component-snippets#using-external-source-for-diff
local function diff_source()
	local gitsigns = vim.b.gitsigns_status_dict
	if gitsigns then
		return {
			added = gitsigns.added,
			modified = gitsigns.changed,
			removed = gitsigns.removed,
		}
	end
end

local diff = {
	"diff",
	colored = true,
	symbols = { added = "+", modified = "≠", removed = "-" }, -- changes diff symbols
	cond = hide_in_width,
	source = diff_source,
}

local mode = {
	"mode",
	--	fmt = function(str)
	--		return "-- " .. str .. " --"
	--	end,
}

local filetype = {
	"filetype",
	icons_enabled = true,
	--	icon = nil,
}

-- use gitsigns for branch name too:  https://github.com/nvim-lualine/lualine.nvim/wiki/Component-snippets#using-external-source-for-branch
local branch = {
	"b:gitsigns_head",
	icons_enabled = true,
	icon = "",
}

-- local location = {
-- 	"location",
-- 	padding = 0,
-- }

-- cool function for progress
--local progress = function()
--	local current_line = vim.fn.line(".")
--	local total_lines = vim.fn.line("$")
--	local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
--	local line_ratio = current_line / total_lines
--	local index = math.ceil(line_ratio * #chars)
--	return chars[index]
--end

-- local spaces = function()
-- 	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
-- end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline", "toggleterm" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { mode },
		lualine_b = { branch, diff },
		lualine_c = { "filename" },
		-- lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_x = { "encoding", filetype },
		lualine_y = { diagnostics },
		lualine_z = { "progress" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
