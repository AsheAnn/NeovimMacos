vim.cmd [[
setlocal isfname+=@-@
setlocal includeexpr=substitute(v:fname,'^@\/','./','')
]]
