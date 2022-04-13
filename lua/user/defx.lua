-- Shorten function name
local keymap = vim.api.nvim_set_keymap
local bufkeymap = vim.api.nvim_buf_set_keymap
local opt = { noremap = true, silent = true, expr = true }
local opts = { noremap = true, silent = true }



keymap('n', 'fs', ":<C-u>Defx -listed -resume -columns=indent:mark:space:icon:space:icons:space:filename:git:size -buffer-name=tab`tabpagenr()` -search=`expand('%:p')` `expand('%:p:h')`<CR>", opts)
keymap('n', 'sf', ":<C-u>Defx -new -columns=indent:mark:space:icon:space:icons:space:filename:git:size -buffer-name=tab`tabpagenr()` -search=`expand('%:p')` `expand('%:p:h')`<CR>", opts)


function DefxSettings()
  bufkeymap(0, 'n', '<CR>', 'defx#do_action("open")', opt)
  bufkeymap(0, 'n', 'c', 'defx#do_action("copy")', opt)
  bufkeymap(0, 'n', 'm', 'defx#do_action("move")', opt)
  bufkeymap(0, 'n', 'p', 'defx#do_action("paste")', opt)
  bufkeymap(0, 'n', 'l', 'defx#do_action("open")', opt)
  bufkeymap(0, 'n', 'L', 'defx#do_action("open", "tabnew")', opt)
  bufkeymap(0, 'n', 'E', 'defx#do_action("open", "vsplit")', opt)
  bufkeymap(0, 'n', 'P', 'defx#do_action("open", "pedit")', opt)
  bufkeymap(0, 'n', 'J', 'defx#do_action("open_or_close_tree")', opt)
  bufkeymap(0, 'n', 'K', 'defx#do_action("new_directory")', opt)
  bufkeymap(0, 'n', 'N', 'defx#do_action("new_file")', opt)
  bufkeymap(0, 'n', 'M', 'defx#do_action("new_multiple_files")', opt)
  bufkeymap(0, 'n', 'C', 'defx#do_action("toggle_columns", "mark:indent:icon:filename:type:size:time")', opt)
  bufkeymap(0, 'n', 'S', 'defx#do_action("toggle_sort", "time")', opt)
  bufkeymap(0, 'n', 'd', 'defx#do_action("remove")', opt)
  bufkeymap(0, 'n', 'r', 'defx#do_action("rename")', opt)
  bufkeymap(0, 'n', '!', 'defx#do_action("execute_command")', opt)
  bufkeymap(0, 'n', 'x', 'defx#do_action("execute_system")', opt)
  bufkeymap(0, 'n', 'yy', 'defx#do_action("yank_path")', opt)
  bufkeymap(0, 'n', '.', 'defx#do_action("toggle_ignored_files")', opt)
  bufkeymap(0, 'n', ';', 'defx#do_action("repeat")', opt)
  bufkeymap(0, 'n', 'h', 'defx#do_action("cd", [".."])', opt)
  bufkeymap(0, 'n', '~', 'defx#do_action("cd")', opt)
  bufkeymap(0, 'n', 'q', 'defx#do_action("quit")', opt)
  bufkeymap(0, 'n', '<Space>', 'defx#do_action("toggle_select")', opt)
  bufkeymap(0, 'n', '*', 'defx#do_action("toggle_select_all")', opt)
  bufkeymap(0, 'n', 'j', 'line(".") == line("$") ? "gg" : "j"', opt)
  bufkeymap(0, 'n', 'k', 'line(".") == 1 ? "G" : "k"', opt)
  bufkeymap(0, 'n', '<C-l>', 'defx#do_action("redraw")', opt)
  bufkeymap(0, 'n', '<C-g>', 'defx#do_action("print")', opt)
  bufkeymap(0, 'n', 'cd', 'defx#do_action("change_vim_cwd")', opt)
end

vim.fn['defx#custom#column']('icon', {
  directory_icon = '▸',
  opened_icon = '▾',
  root_icon = ' ',
})

vim.fn['defx#custom#column']('git', 'indicators', {
  Modified = 'M',
  Staged = '✚',
  Untracked = '✭',
  Renamed = '➜',
  Unmerged = '═',
  Ignored = '☒',
  Deleted = '✖',
  Unknown = '?'
})


vim.fn['defx#custom#column']('indent','space', {
  indent = '   ',
})




vim.fn['defx#custom#option']('_', {
  show_ignored_files = '0',
  ignored_files = '.DS_Store',
  buffer_name = 'defxplorer',
  columns = 'git:indent:icon:space:icons:space:filename:size',
  resume = 1,
})


vim.cmd('autocmd FileType defx call v:lua.DefxSettings()')
vim.cmd('autocmd VimEnter * execute "Defx -new -columns=indent:mark:space:icon:space:icons:space:filename:git:size"')
