local status_ok, helix = pcall(require, "helix")
if not status_ok then
	return
end

helix.setup()
