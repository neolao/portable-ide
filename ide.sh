#!/bin/bash

scriptPath="$( readlink -f "$( dirname "$0" )" )/$( basename "$0" )"
currentDirectory=$(dirname $scriptPath)

export IDE_DIRECTORY_PATH=$currentDirectory
export VIMRUNTIME=$IDE_DIRECTORY_PATH/runtime/nvim
export NVIM_CONFIG=$IDE_DIRECTORY_PATH/config/nvim
export ZDOTDIR=$IDE_DIRECTORY_PATH/runtime/zsh
export SHELL=$IDE_DIRECTORY_PATH/apps/zsh/bin/zsh
export PATH="$IDE_DIRECTORY_PATH/apps:$IDE_DIRECTORY_PATH/apps/zsh/bin:$PATH"

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
  nvim $APPIMAGE_OPTIONS -u $IDE_DIRECTORY_PATH/config/nvim/vimrc.vim $TARGET
else
  mkdir -p $IDE_DIRECTORY_PATH/tmp
  TMUX_OPTIONS="-2 -S $IDE_DIRECTORY_PATH/tmp/tmux.pid -f $IDE_DIRECTORY_PATH/config/tmux/tmux.conf"
  TMUX_SESSION_NAME="ide"
  tmux $TMUX_OPTIONS new-session -d -s $TMUX_SESSION_NAME
  tmux $TMUX_OPTIONS new-window -t $TMUX_SESSION_NAME:1 -k -n "EDITOR" nvim $APPIMAGE_OPTIONS -u $IDE_DIRECTORY_PATH/config/nvim/vimrc.vim $TARGET
  tmux $TMUX_OPTIONS select-window -t $TMUX_SESSION_NAME:1.0
  tmux $TMUX_OPTIONS attach -t $TMUX_SESSION_NAME
fi

