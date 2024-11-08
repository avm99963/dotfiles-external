vim.o.tabstop = 2    -- tab width is 2 spaces
vim.o.shiftwidth = 2 -- indent also with 2 spaces

vim.o.number = true
vim.o.relativenumber = true
vim.g.mapleader = ','

-- use indentation of previous line
vim.o.autoindent = true
vim.o.expandtab = true -- expand tabs to spaces

-- intelligent comments
vim.opt.comments = {
  sl = '/*',
  mb = ' *',
  elx = ' */',
}

vim.opt.mouse = 'a'
vim.opt.ruler = true

-- Vimscript syntax highlighting unused:
-- hi jjdescriptionHeader guifg=#b3deef ctermfg=153 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
-- hi jjdescriptionSelectedType guifg=#9faa00 ctermfg=142 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
-- hi jjdescriptionSelectedFile guifg=#c9d05c ctermfg=185 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE

-- == Mac fixes: ==
-- So the backspace key works correctly with brew's vim
-- vim.opt.backspace = "2"

-- So MD italics show in italics
vim.cmd.highlight('Comment', 'cterm=italic')

-- To show nbsp characters (added by Alt+Space) as dots
vim.opt.listchars={
  tab = '» ',
  extends = '›',
  precedes = '‹',
  nbsp = '·',
  trail = '·',
}
vim.opt.list = true
