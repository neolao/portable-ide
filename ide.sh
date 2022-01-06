#!/bin/bash

scriptPath="$( readlink -f "$( dirname "$0" )" )/$( basename "$0" )"
currentDirectory=$(dirname $scriptPath)

export VIMRUNTIME=$currentDirectory/runtime

APPIMAGE_OPTIONS=''
TMUX_ENABLED=0
TARGET='.'
while test $# -gt 0; do
  case "$1" in
    --extract-and-run)
      APPIMAGE_OPTIONS='--appimage-extract-and-run'
      shift
      ;;

    --tmux)
      TMUX_ENABLED=1
      shift
      ;;

    *)
      TARGET="$1"
      shift
      ;;
  esac
done

if [ "$TMUX_ENABLED" -eq 0 ]
then
  ./nvim-*.appimage $APPIMAGE_OPTIONS -u $currentDirectory/config/vimrc.vim $TARGET
else
  mkdir -p ./tmp
  TMUX_OPTIONS="-2 -S ./tmp/tmux.pid"
  TMUX_SESSION_NAME="ide"
  ./tmux-*.appimage $TMUX_OPTIONS new-session -d -s $TMUX_SESSION_NAME
  ./tmux-*.appimage $TMUX_OPTIONS new-window -t $TMUX_SESSION_NAME:1 -k -n "EDITOR" ./nvim-*.appimage $APPIMAGE_OPTIONS -u $currentDirectory/config/vimrc.vim $TARGET
  ./tmux-*.appimage $TMUX_OPTIONS select-window -t $TMUX_SESSION_NAME:1.0
  ./tmux-*.appimage $TMUX_OPTIONS attach -t $TMUX_SESSION_NAME
fi

