highlight Tab ctermbg=darkgray guibg=darkgray
highlight Space ctermbg=darkgray guibg=darkgray
au BufWinEnter * let w:m2=matchadd('Tab', '\t', -1)
au BufWinEnter * let w:m3=matchadd('Space', '\s\+$\| \+\ze\t', -1)
set listchars=tab:>-,trail:~
