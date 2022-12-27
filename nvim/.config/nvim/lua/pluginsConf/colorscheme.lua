local nightfox = Prequire("nightfox")

if nightfox ~= nil then
	nightfox.setup({
		groups = {
			all = {
				TelescopePromptBorder = { link = "TelescopeSelection" },
				TelescopePromptCounter = { link = "TelescopeSelection" },
				TelescopePromptTitle = { link = "TelescopeSelection" },
				TelescopeNormal = { bg = "bg0", fg = "fg2" },
				TelescopePreviewBorder = { bg = "bg0", fg = "fg2" },
				TelescopeResultsBorder = { bg = "bg0", fg = "fg2" },
				FloatBorder = { bg = "bg0", fg = "fg2" },
			},
		},
	})
end

local onedark = Prequire("onedarkpro")

if onedark ~= nil then
	local color = require("onedarkpro.lib.color")
	local gray = color.lighten("#000000", 0.1, "#1b1b1b")
	onedark.setup({
		colors = {
			onedark_dark = {
				telescope_results = color.lighten(onedark.get_colors("onedark").bg, 0.99),
				telescope_prompt = color.darken(onedark.get_colors("onedark").bg, 0.05),
			},
			onelight = {
				telescope_prompt = color.darken(onedark.get_colors("onelight").bg, 0.98),
				telescope_results = color.darken(onedark.get_colors("onelight").bg, 0.95),
			},
		},
		highlights = {
			TelescopeBorder = {
				fg = "${telescope_results}",
				bg = "${telescope_results}",
			},
			TelescopePromptBorder = {
				fg = "${telescope_prompt}",
				bg = "${telescope_prompt}",
			},
			TelescopePromptCounter = { fg = "${fg}" },
			TelescopePromptNormal = { fg = "${fg}", bg = "${telescope_prompt}" },
			TelescopePromptPrefix = {
				fg = "${purple}",
				bg = "${telescope_prompt}",
			},
			TelescopePromptTitle = {
				fg = "${telescope_prompt}",
				bg = "${purple}",
			},
			TelescopePreviewTitle = {
				fg = "${telescope_results}",
				bg = "${green}",
			},
			TelescopeResultsTitle = {
				fg = "${telescope_results}",
				bg = "${telescope_results}",
			},

			TelescopeMatching = { fg = "${purple}" },
			TelescopeNormal = { bg = "${telescope_results}" },
			TelescopeSelection = { bg = "${telescope_prompt}" },
      CursorLine = { bg = "${telescope_results}" },
      PmenuSel = { bg = "${telescope_results}" },
		},
	})
end

local gruvbox = Prequire("gruvbox")

if gruvbox ~= nil then
	gruvbox.setup({
		undercurl = true,
		underline = true,
		bold = true,
		italic = true,
		strikethrough = true,
		invert_selection = false,
		invert_signs = false,
		invert_tabline = false,
		invert_intend_guides = false,
		inverse = true, -- invert background for search, diffs, statuslines and errors
		contrast = "hard", -- can be "hard", "soft" or empty string
		palette_overrides = {},
		overrides = {},
		dim_inactive = false,
		transparent_mode = false,
		overrides = {
			SignColumn = { bg = "#1d2021" },
			GitSignsAdd = { bg = "#1d2021", fg = "#98971a" },
			GitSignsChange = { bg = "#1d2021", fg = "#83a598" },
			GitSignsDelete = { bg = "#1d2021", fg = "#cc241d" },
			DiagnosticSignError = { bg = "#1d2021", fg = "#cc241d" },
			DiagnosticSignWarn = { bg = "#1d2021", fg = "#d79921" },
			DiagnosticSignHint = { bg = "#1d2021", fg = "#fabd2f" },
			DiagnosticSignInfo = { bg = "#1d2021", fg = "#98971a" },
			TelescopePromptBorder = { link = "TelescopeSelection" },
			TelescopePromptCounter = { link = "TelescopeSelection" },
			TelescopePromptTitle = { link = "TelescopeSelection" },
		},
	})
end

vim.cmd("colorscheme onedark_dark")
