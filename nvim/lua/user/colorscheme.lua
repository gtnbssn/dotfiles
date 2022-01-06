vim.g.gruvbox_italic = 1
vim.g.gruvbox_sign_column = 'bg0'

vim.cmd [[
try
  colorscheme gruvbox
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
-- TODO try darkplus
