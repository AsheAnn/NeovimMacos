local status_ok, chatgpt = pcall(require, "chatgpt")
if not status_ok then
	return
end

chatgpt.setup({
	welcome_message = "", -- set to "" if you don't like the fancy godot robot
	--[[ loading_text = "loading", ]]
	--[[ keymaps = { ]]
	--[[ 	close = { "<C-c>", "<Esc>" }, ]]
	--[[ 	yank_last = "<C-y>", ]]
	--[[ 	scroll_up = "<C-u>", ]]
	--[[ 	scroll_down = "<C-d>", ]]
	--[[ 	toggle_settings = "<C-o>", ]]
	--[[ 	new_session = "<C-m>", ]]
	--[[ 	cycle_windows = "<Tab>", ]]
	--[[ }, ]]
})
