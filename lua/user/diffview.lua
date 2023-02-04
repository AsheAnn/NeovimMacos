local status_ok, diffview = pcall(require, "diffview")
if not status_ok then
	return
end

local actions = require("diffview.actions")


diffview.setup({
	diff_binaries = false,
	enhanced_diff_hl = true,
	git_cmd = { "git" },
	use_icons = true,
	show_help_hints = false,
	icons = {
		folder_closed = "",
		folder_open = "",
	},
	signs = {
		fold_closed = "",
		fold_open = "",
	},
	view = {
		default = {
			winbar_info = false,
		},
		merge_tool = {
			layout = "diff3_mixed",
			disable_diagnostics = true,
			winbar_info = true,
		},
		file_history = {
			winbar_info = false,
		},
	},
	file_panel = {
		listing_style = "tree",
		tree_options = {
			flatten_dirs = true,
			folder_statuses = "only_folded",
		},
		win_config = {
			position = "left",
			width = 35,
		},
	},
	file_history_panel = {
		log_options = {
			git = {
				single_file = {
					diff_merges = "combined",
					follow = true,
				},
				multi_file = {
					diff_merges = "first-parent",
				},
			},
		},
		win_config = {
			position = "bottom",
			height = 16,
		},
	},
	commit_log_panel = {
		win_config = {},
	},
	default_args = {
		DiffviewOpen = {},
		DiffviewFileHistory = {},
	},
	keymaps = {
		view = {
			["gf"] = actions.goto_file_edit,
			["-"] = actions.toggle_stage_entry,
		},
		file_panel = {
			["<cr>"] = actions.focus_entry,
			["s"] = actions.toggle_stage_entry,
			["gf"] = actions.goto_file_edit,
			["cc"] = "<Cmd>Git commit <bar> wincmd J<CR>",
			["ca"] = "<Cmd>Git commit --amend <bar> wincmd J<CR>",
			["cs"] = "<Cmd>Git commit --squash <bar> wincmd J<CR>",
			["c<Space>"] = ":Git commit ",
		},
		file_history_panel = {
			["<cr>"] = actions.focus_entry,
			["gf"] = actions.goto_file_edit,
		},
	},
})
