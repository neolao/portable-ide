if isdirectory($VIMRUNTIME . '/swap') == 0
  :silent !mkdir -p $VIMRUNTIME/swap >/dev/null 2>&1
endif
set directory=$VIMRUNTIME/swap/
