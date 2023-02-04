local status_ok, copilot = pcall(require, "copilot")
if not status_ok then
	return
end

copilot.setup({
	panel = { enabled = false },
	suggestion = { enabled = false },
	ft_disable = { "markdown" },
	-- plugin_manager_path = vim.fn.stdpath "data" .. "/site/pack/packer",
	server_opts_overrides = {
		trace = "verbose",
		settings = {
			advanced = {
				listCount = 10,
				inlineSuggestCount = 3, -- #completions for getCompletions
			},
		},
	},
})
