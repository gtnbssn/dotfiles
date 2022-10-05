local leap = Prequire("leap")

local setup = {
  max_aot_targets = nil,
  highlight_unlabeled = false,
  max_highlighted_traversal_targets = 10,
  case_sensitive = false,
  -- Sets of characters that should match each other.
  -- Obvious candidates are braces and quotes ('([{', ')]}', '`"\'').
  equivalence_classes = { ' \t\r\n', },
  -- Leaving the appropriate list empty effectively disables "smart" mode,
  -- and forces auto-jump to be on or off.
  --[[ safe_labels = { . . . },
  labels = { . . . }, ]]
	safe_labels = { "s", "f", "n", "u", "t", "/", "F", "L", "N", "H", "G", "M", "U", "T", "?", "Z" },
  labels = { "s", "f", "n", "j", "k", "l", "o", "d", "w", "e", "h", "m", "v", "g", "u", "t", "c", ".", "z", "/", "F", "L",
    "N", "H", "G", "M", "U", "T", "?", "Z" },
  special_keys = {
    repeat_search  = '<enter>',
    next_aot_match = '<enter>',
    next_match     = {';', '<enter>'},
    prev_match     = {',', '<tab>'},
    next_group     = '<Tab>',
    prev_group     = '<S-Tab>',
  },
}

if leap ~= nil then
  leap.set_default_keymaps()
	leap.setup(setup)
end
