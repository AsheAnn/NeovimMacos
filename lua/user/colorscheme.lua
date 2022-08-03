----dracula
vim.g.dracula_colors = {yellow = "#ffeb19",green = "#49ff86"}
vim.g.neosolarized_termtrans = true


vim.cmd [[
try
  
colorscheme tokyonight

catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
endtry
]]
