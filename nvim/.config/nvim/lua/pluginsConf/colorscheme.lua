--[[ require("gruvbox").setup({
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
  contrast = "", -- can be "hard", "soft" or empty string
  overrides = {
    SignColumn = { bg = "#282828" },
    GitSignsAdd = { bg = "#282828", fg = "#98971a" },
    GitSignsChange = { bg = "#282828", fg = "#83a598" },
    GitSignsDelete = { bg = "#282828", fg = "#cc241d" },
    DiagnosticSignError = { bg = "#282828", fg = "#cc241d" },
    DiagnosticSignWarn = { bg = "#282828", fg = "#d79921" },
    DiagnosticSignHint = { bg = "#282828", fg = "#fabd2f" },
    DiagnosticSignInfo = { bg = "#282828", fg = "#98971a" },
  },
}) ]]
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

vim.cmd("colorscheme carbonfox")
