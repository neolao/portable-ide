if isdirectory($VIMRUNTIME . '/backup') == 0
  :silent !mkdir -p $VIMRUNTIME/backup >/dev/null 2>&1
endif
set backupdir=$VIMRUNTIME/backup/
set backup
