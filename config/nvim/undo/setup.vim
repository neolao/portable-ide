if exists("+undofile")
  if isdirectory($VIMRUNTIME . '/undo') == 0
    :silent !mkdir -p $VIMRUNTIME/undo > /dev/null 2>&1
  endif
  set undodir=$VIMRUNTIME/undo/
  set undofile
  set undolevels=150
endif
