local M = {}
local colors = require "user.colors"
local navic = require "nvim-navic"
local icons = require "user.icons"

local function is_empty(s)
  return s == nil or s == ""
end

local function get_buf_option(opt)
  local status_ok, buf_option = pcall(vim.api.nvim_buf_get_option, 0, opt)
  if not status_ok then
    return nil
  else
    return buf_option
  end
end

vim.api.nvim_set_hl(0, "WinBarSeparator", { fg = colors.cyan, bg = colors.bg })
vim.api.nvim_set_hl(0, "WinBarFilename", { fg = colors.cyan, bg = colors.bg})
vim.api.nvim_set_hl(0, "WinBarContext", { fg = colors.cyan, bg = colors.bg})

M.winbar_filetype_exclude = {
	"help",
	"startify",
	"dashboard",
	"packer",
	"neogitstatus",
	"NvimTree",
	"Trouble",
	"alpha",
	"lir",
	"Outline",
	"spectre_panel",
	"toggleterm",
	"DressingSelect",
	"Jaq",
	"harpoon",
	"dapui_scopes",
	"dapui_breakpoints",
	"dapui_stacks",
	"dapui_watches",
	"dap-repl",
	"dap-terminal",
	"dapui_console",
	"lab",
	"Markdown",
	"",
}

local excludes = function()
  if vim.tbl_contains(M.winbar_filetype_exclude, vim.bo.filetype) then
    vim.opt_local.winbar = nil
    return true
  end
  return false
end

local function get_modified()
  if get_buf_option "mod" then
    local mod = icons.git.Mod
    return "%#WinBarContext#" .. mod .. "  " .. "%t" .. "%*"
  end
  return "%#WinBarContext#" .. "%t" .. "%*"
end

local function get_location()
  local location = navic.get_location()
  if not is_empty(location) then
    return "%#WinBarContext#" .. " " .. icons.ui.ChevronRight .. " " .. location .. "%*"
  end
  return ""
end

function M.get_winbar()
  if excludes() then
    return ""
  end
  if navic.is_available() then
    return "%#WinBarSeparator#"
      .. get_modified()
      .. get_location()
      .. "%#WinBarSeparator#"
  else
    return "%#WinBarSeparator#" ..  get_modified() .. "%#WinBarSeparator#"
  end
end

return M
