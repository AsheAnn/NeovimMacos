----customtokyonight
vim.g.tokyonight_transparent = true
vim.g.tokyonight_transparent_sidebar = true
vim.g.tokyonight_lualine_bold = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
vim.g.tokyonight_colors = {error = "#ff001e", green = "#49ff86"}

----dracula
vim.g.dracula_transparent_bg = true
vim.g.dracula_colors = {yellow = "#ffeb19",green = "#49ff86"}
vim.g.transparent_background = true
vim.g.neosolarized_termtrans = true



vim.cmd [[
try
  
colorscheme tokyonight
"colorscheme NeoSolarized
"colorscheme onedarkpro
"colorscheme onedark
"colorscheme dracula
"colorscheme ayu  

catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
endtry
]]
