local status_ok, neural = pcall(require, "neural")
if not status_ok or vim.env.OPENAI_API_KEY == nil then
	return
end

neural.setup({
	mappings = {
		swift = "<C-n>", -- Context completion
		prompt = "<C-space>", -- Open prompt
	},
	open_ai = {
		api_key = vim.env.OPENAI_API_KEY,
	},
})
