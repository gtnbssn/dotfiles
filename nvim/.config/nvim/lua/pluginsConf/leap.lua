local leap = Prequire("leap")

local setup = {
	max_aot_targets = nil,
	highlight_unlabeled = false,
	max_highlighted_traversal_targets = 10,
	case_sensitive = false,
	-- Sets of characters that should match each other.
	-- Obvious candidates are braces and quotes ('([{', ')]}', '`"\'').
	equivalence_classes = { " \t\r\n" },
	-- Leaving the appropriate list empty effectively disables "smart" mode,
	-- and forces auto-jump to be on or off.
	--[[ safe_labels = { "s", "f", "n", "u", "t", "/", "F", "L", "N", "H", "G", "M", "U", "T", "?", "Z" },
	labels = {"s","f","n","j","k","l","o","d","w","e","h","m","v","g","u","t","c",".","z","/","F","L","N","H","G","M","U","T","?","Z" }, ]]
	special_keys = {
		repeat_search = "<enter>",
		next_phase_one_target = "<enter>",
		next_target = { "<enter>", ";" },
		prev_target = { "<tab>", "," },
		next_group = "S-<tab>",
		prev_group = "<tab>",
		multi_accept = "<enter>",
		multi_revert = "<backspace>",
	},
}

if leap ~= nil then
	leap.add_default_mappings()
	leap.setup(setup)
end
