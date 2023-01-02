local status, neural = pcall(require, "neural")
if not status then
	return
end

neural.setup({
	mappings = {
		swift = "<C-n>", -- Context completion
		prompt = "<C-space>", -- Open prompt
	},
	open_ai = {
		api_key = vim.env.OPEN_AI_KEY,
	},
})
