local status_ok, navic = pcall(require, "nvim-navic")
if not status_ok then
  return
end

local icons = require "user.icons"
local set_hl = vim.api.nvim_set_hl
local colors = require "user.colors"

navic.setup {
  icons = {
    Text = " ",
    Method = "m ",
    Function = " ",
    -- Constructor = "",
    Constructor = " ",
    Field = " ",
    -- Variable = "",
    Variable = " ",
    Class = " ",
    Interface = " ",
    -- Module = "",
    Module = " ",
    Property = " ",
    Unit = " ",
    Value = " ",
    Enum = " ",
    -- Keyword = "",
    Keyword = " ",
    -- Snippet = "",
    Snippet = " ",
    Color = " ",
    File = " ",
    Reference = " ",
    Folder = " ",
    EnumMember = " ",
    Constant = " ",
    Struct = " ",
    Event = " ",
    Operator = " ",
    TypeParameter = " ",
    Array = " ",
    Number = " ",
    String = " ",
    Boolean = "蘒",
    Object = " ",
    Namespace = ':: ',
    Package = '  ',
    Key = ' ',
    Null = '{ } ',
  },
  highlight = true,
  separator = " " .. icons.ui.ChevronRight .. " ",
  depth_limit = 0,
  depth_limit_indicator = "..",
}



set_hl(0, "NavicIconsFile",         { fg = colors.cyan, bg = colors.bg })
set_hl(0, "NavicIconsModule",       { fg = colors.cyan, bg = colors.bg })
set_hl(0, "NavicIconsNamespace",    { fg = colors.cyan, bg = colors.bg })
set_hl(0, "NavicIconsPackage",      { fg = colors.cyan, bg = colors.bg })
set_hl(0, "NavicIconsClass",        { fg = colors.cyan, bg = colors.bg })
set_hl(0, "NavicIconsMethod",       { fg = colors.cyan, bg = colors.bg })
set_hl(0, "NavicIconsProperty",     { fg = colors.cyan, bg = colors.bg })
set_hl(0, "NavicIconsField",        { fg = colors.cyan, bg = colors.bg })
set_hl(0, "NavicIconsConstructor",  { fg = colors.cyan, bg = colors.bg })
set_hl(0, "NavicIconsEnum",         { fg = colors.cyan, bg = colors.bg })
set_hl(0, "NavicIconsInterface",    { fg = colors.cyan, bg = colors.bg })
set_hl(0, "NavicIconsFunction",     { fg = colors.cyan, bg = colors.bg })
set_hl(0, "NavicIconsVariable",     { fg = colors.cyan, bg = colors.bg })
set_hl(0, "NavicIconsConstant",     { fg = colors.cyan, bg = colors.bg })
set_hl(0, "NavicIconsString",       { fg = colors.cyan, bg = colors.bg })
set_hl(0, "NavicIconsNumber",       { fg = colors.cyan, bg = colors.bg })
set_hl(0, "NavicIconsBoolean",      { fg = colors.cyan, bg = colors.bg })
set_hl(0, "NavicIconsArray",        { fg = colors.cyan, bg = colors.bg })
set_hl(0, "NavicIconsObject",       { fg = colors.cyan, bg = colors.bg })
set_hl(0, "NavicIconsKey",          { fg = colors.cyan, bg = colors.bg })
set_hl(0, "NavicIconsNull",         { fg = colors.cyan, bg = colors.bg })
set_hl(0, "NavicIconsEnumMember",   { fg = colors.cyan, bg = colors.bg })
set_hl(0, "NavicIconsStruct",       { fg = colors.cyan, bg = colors.bg })
set_hl(0, "NavicIconsEvent",        { fg = colors.cyan, bg = colors.bg })
set_hl(0, "NavicIconsOperator",     { fg = colors.cyan, bg = colors.bg })
set_hl(0, "NavicIconsTypeParameter",{ fg = colors.cyan, bg = colors.bg })
set_hl(0, "NavicText",              { fg = colors.cyan, bg = colors.bg })
set_hl(0, "NavicSeparator",         { fg = colors.cyan, bg = colors.bg })
