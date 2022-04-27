local status_ok, code_runner = pcall(require, "code_runner")
if not status_ok then
	return
end

code_runner.setup({
	term = {
		mode = "",
		position = "belowright",
		size = 6,
	},
	filetype = {
		javascript = "node",
		javascriptreact = "node",
		python = "python3",
		typescript = "deno run",
		ruby = "ruby",
    go = "go run"
	},
})
