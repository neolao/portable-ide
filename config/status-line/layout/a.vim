" File path, modified flag, type, readonly, encoding, line:column, progression
set statusline=
set statusline+=\ %f
set statusline+=\ %#CursorColumn#
set statusline+=%m
set statusline+=%y
set statusline+=%r
set statusline+=%=
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ %l/%L:%c
set statusline+=\ %p%%
set statusline+=\
