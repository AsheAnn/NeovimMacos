----dracula
vim.g.dracula_colors = { yellow = "#ffeb19", green = "#49ff86" }
vim.g.neosolarized_termtrans = true
vim.g.github_transparent = true
vim.g.tokyonight_colors = {error = "#ff001e", green = "#49ff86"}

vim.cmd([[
try
 
colorscheme tokyonight

catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
endtry
]])

