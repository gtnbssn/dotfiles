require("gruvbox").setup({
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
    SignColumn = {bg = "#282828"},
    GitSignsAdd = {bg = "#282828", fg = "#98971a"},
    GitSignsChange = {bg = "#282828", fg = "#83a598"},
    GitSignsDelete = {bg = "#282828", fg = "#cc241d"},
  },
})
vim.cmd("colorscheme gruvbox")
