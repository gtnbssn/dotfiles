-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`

local nvim_tree = Prequire("nvim-tree")

local nvim_tree_config = Prequire("nvim-tree.config")

if nvim_tree_config ~= nil then
	local tree_cb = nvim_tree_config.nvim_tree_callback
	if nvim_tree ~= nil then
		nvim_tree.setup({
			disable_netrw = true,
			hijack_netrw = true,
			open_on_tab = false,
			hijack_cursor = false,
			update_cwd = true,
			diagnostics = {
				enable = true,
				icons = {
					hint = "",
					info = "",
					warning = "",
					error = "",
				},
			},
			update_focused_file = {
				enable = true,
				update_cwd = true,
				ignore_list = {},
			},
			system_open = {
				cmd = nil,
				args = {},
			},
			filters = {
				dotfiles = false,
				custom = {},
			},
			git = {
				enable = true,
				ignore = true,
				timeout = 500,
			},
			view = {
				width = 30,
				hide_root_folder = false,
				side = "left",
				mappings = {
					custom_only = false,
					list = {
						{ key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
						{ key = "h", cb = tree_cb("close_node") },
						{ key = "v", cb = tree_cb("vsplit") },
					},
				},
				number = false,
				relativenumber = false,
			},
			trash = {
				cmd = "trash",
				require_confirm = true,
			},
			renderer = {
				highlight_git = true,
				icons = {
					show = {
						git = true,
						folder = true,
						file = true,
						folder_arrow = true,
					},
					glyphs = {
						default = "",
						symlink = "",
						git = {
							unstaged = "⧋",
							staged = "⨺",
							unmerged = "",
							renamed = "➜",
							deleted = "×",
							untracked = "⨇",
							ignored = "◌",
						},
						folder = {
							default = "",
							open = "",
							empty = "",
							empty_open = "",
							symlink = "",
						},
					},
				},
			},
		})
	end
end
